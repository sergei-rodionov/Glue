package com.glue.domain.v2;

/**
 * Several EVDB objects contain properties
 * 
 * 
 * 
 */

public class Property {

    /**
     * Property ID
     */
    private int id;

    /**
     * Name of the property
     */
    private String name;

    /**
     * Property value
     */
    private String value;

    public Property() {
    }

    public Property(String name, String value) {
	this.name = name;
	this.value = value;
    }

    /**
     * @return the id
     */
    public int getId() {
	return id;
    }

    /**
     * @param id
     *            the id to set
     */
    public void setId(int id) {
	this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
	return name;
    }

    /**
     * @param name
     *            the name to set
     */
    public void setName(String name) {
	this.name = name;
    }

    /**
     * @return the value
     */
    public String getValue() {
	return value;
    }

    /**
     * @param value
     *            the value to set
     */
    public void setValue(String value) {
	this.value = value;
    }

}
