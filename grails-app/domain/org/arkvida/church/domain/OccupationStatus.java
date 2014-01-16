/**
 * 
 */
package org.arkvida.church.domain;

/**
 * @author harrisun
 * 
 */
public enum OccupationStatus {
	student(1), working(5), retired(10), housewife(4), misc(5);
	OccupationStatus(int pvalue) {
		this.value = pvalue;
	}

	private final int value;

	public int value() {
		return value;
	}
}
