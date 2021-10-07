import os
import git
from datetime import datetime
import sys
import logging


def get_committ(path):
    if os.path.isfile(path):
        path = os.path.dirname(path)
    repo = git.Repo(path, search_parent_directories=True)
    commit = repo.head.commit.hexsha
    return commit


def log_basics():
    git_id = get_committ(".")
    logging.info('git id: {}'.format(git_id))
    time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    logging.info('start time: {}'.format(time))
    args = " ".join(sys.argv)
    logging.info('args: {}'.format(args))
    try:
        import torch
        gpu = torch.cuda.is_available()
        logging.info('cuda available: {}'.format(gpu)) 
        if gpu:
            logging.info('cuda version: {}'.format(torch.version.cuda))
            logging.info('cudnn version: {}'.format(torch.backends.cudnn.version()))
    except:
        pass



if __name__ == '__main__':
    print('my committ', log_basics(__file__))

