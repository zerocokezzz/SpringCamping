package kr.co.dong.VO;

public class SelectPKVO {
	
	private int PK;

	public SelectPKVO() {
		super();
	}

	public SelectPKVO(int pK) {
		super();
		PK = pK;
	}

	public int getPK() {
		return PK;
	}

	public void setPK(int pK) {
		PK = pK;
	}

	@Override
	public String toString() {
		return "SelectPKVO [PK=" + PK + "]";
	}
	
}
