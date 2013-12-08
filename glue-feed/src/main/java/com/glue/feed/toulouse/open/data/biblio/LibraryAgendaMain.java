package com.glue.feed.toulouse.open.data.biblio;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.glue.feed.FeedMessageListener;
import com.glue.feed.GlueObjectBuilder;
import com.glue.feed.xml.StreamMessageListener;
import com.glue.feed.xml.XMLFeedParser;
import com.glue.struct.IStream;

/**
 * AGENDA DES MANIFESTATIONS DE LA BIBLIOTHÈQUE DE TOULOUSE.
 * 
 * Flux XML contenant tous les événements et animations en place au sein de la
 * Bibliothèque de Toulouse (Médiathèque José Cabanis, Bibliothèque d’Étude et
 * du Patrimoine de Périgord et les 22 bibliothèques de quartier)
 * 
 * @author pgillet
 * @see http
 *      ://data.grandtoulouse.fr/web/guest/les-donnees/-/opendata/card/23577-
 *      agenda-des-manifestations-de-la-bibliotheque-de-toulouse
 */
public class LibraryAgendaMain {

	static final Logger LOG = LoggerFactory.getLogger(LibraryAgendaMain.class);

	public static void main(String[] args) throws Exception {

		URL url = new URL("http://www.bibliotheque.toulouse.fr/fluxEvents.xml");
		InputStream in = url.openStream();

		Reader reader0 = new InputStreamReader(in, "UTF-8");
		Reader reader = new BufferedReader(reader0);

		XMLFeedParser<Record> parser = new XMLFeedParser<Record>(reader,
				Record.class);

		final FeedMessageListener delegate = new StreamMessageListener();
		final GlueObjectBuilder<Record, IStream> streamBuilder = new RecordStreamBuilder();

		parser.setFeedMessageListener(new FeedMessageListener<Record>() {

			@Override
			public void newMessage(Record msg) throws Exception {
				IStream stream = streamBuilder.build(msg);
				delegate.newMessage(stream);
			}

			@Override
			public void close() throws IOException {
				delegate.close();
			}
		});

		parser.read();
		parser.close();
		LOG.info("Done");

	}
}
