import time

from worker import Worker

if __name__ == "__main__":
    """This is used to test RTD functionalities"""
    start = time.time()

    w1 = Worker()
    r = w1.run()

    end = time.time()

    print(f"Rodou worker em {round(end - start, 2)} seconds")
