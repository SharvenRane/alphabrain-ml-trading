\"\"\"CLI entrypoint to download market data into data/raw using alphabrain.data.ingestion.\"\"\"

from alphabrain.data.ingestion import download_price_history
from alphabrain.config import load_data_config  # will implement later


def main() -> None:
    cfg = load_data_config()
    download_price_history(
        tickers=cfg["tickers"],
        start=cfg["start_date"],
        end=cfg["end_date"],
        interval=cfg.get("price_interval", "1d"),
    )


if __name__ == "__main__":
    main()
