package com.glue.feed.html;

import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PaginatedListStrategy implements VisitorStrategy {

    static final Logger LOG = LoggerFactory
	    .getLogger(PaginatedListStrategy.class);

    private SiteMap siteMap;

    private VisitorListener visitorListener;

    public PaginatedListStrategy(SiteMap siteMap) {
	this.siteMap = siteMap;
    }

    @Override
    public void visit() throws Exception {
	String baseUri = siteMap.getBaseUri();
	Document doc = Jsoup.connect(baseUri).get();

	boolean nextPage = false;
	int numPage = 0;

	do {
	    numPage++;
	    LOG.info("Page number  = " + numPage);

	    // Elements that match the list selector
	    Elements list = doc.select(siteMap.getListSelector());
	    if (list.isEmpty()) {
		// One of the end of data conditions
		// TODO: should be composable!
		break;
	    }

	    Iterator<Element> iter = list.iterator();
	    while (iter.hasNext()) {
		// Link to the event details page
		Element elem = iter.next();
		elem = elem.select("a").first();

		if (elem != null) {
		    String linkHref = elem.attr("abs:href");
		    LOG.info("Item link = " + linkHref);
		    // Notify listener
		    if (visitorListener != null) {
			visitorListener.processLink(linkHref);
		    }
		}
	    }

	    // Pagination
	    // Elements that match the end of data condition
	    if (siteMap.getEndOfDataCondition() != null) {
		Elements lastElems = doc
			.select(siteMap.getEndOfDataCondition());
		if (!lastElems.isEmpty()) {
		    // We reached the last page
		    break;
		}
	    }

	    // Elements that match the next page selector
	    if (siteMap.getNextPageSelector() != null) {
		Elements pageElems = doc.select(siteMap.getNextPageSelector());
		Iterator<Element> pages = pageElems.iterator();

		nextPage = pages.hasNext();

		if (nextPage) {
		    // Load the next page
		    Element link = pages.next();
		    link = link.select("a").first();
		    if (link != null) {
			String linkHref = link.attr("abs:href");
			doc = Jsoup.connect(linkHref).get();
		    }
		}
	    }

	} while (nextPage);

    }

    public VisitorListener getVisitorListener() {
	return visitorListener;
    }

    @Override
    public void setVisitorListener(VisitorListener visitorListener) {
	this.visitorListener = visitorListener;
    }

}
