import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Search {

	public static void search(String url) {
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			System.err.println("Não foi possivel conectar!");
			e.printStackTrace();
		}
		// pega a seção dos mais vendidos
		Element section = doc.getElementById("mais-vendidos");

		// pega as urls de cada area de vendas
		Elements as = section.getElementsByAttributeValue("data-ajaxbox", "#mais-vendidos .content");

		for (Element a : as) {
			String link = a.attr("href");
			System.out.println("\n\t" + a.text() + " - " + link);
			try {
				processPage(url + link);
			} catch (IOException e) {
				System.err.println("Não foi possivel conectar!");
				e.printStackTrace();
			}
		}

		System.out.println("\nProcura encerrada.");

	}

	public static void processPage(String URL) throws IOException {
		Document doc = Jsoup.connect(URL).get();

		// pega a seção dos mais vendidos
		Element section = doc.getElementById("mais-vendidos");

		Elements articles = section.getElementsByTag("article");

		// Mostra a lista
		for (Element article : articles) {
			Element e = article.getElementsByAttributeValue("class", "productImg").first().child(0);
			String produto = e.attr("title");
			System.out.println("Produto: " + produto);
			String valor = article.getElementsByAttributeValue("class", "product-price-integer").text();
			System.out.println("Valor:  R$ " + valor + ",00");

		}

	}

}
