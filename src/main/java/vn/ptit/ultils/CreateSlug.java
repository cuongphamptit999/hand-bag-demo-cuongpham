package vn.ptit.ultils;

import com.github.slugify.Slugify;

public class CreateSlug {
	public String createSlug(String text) {
		Slugify slg = new Slugify();
		String result = slg.slugify(text + "-" + (System.currentTimeMillis()));
		return result;
	}

}
