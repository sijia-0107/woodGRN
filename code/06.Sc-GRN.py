import pandas as pd

from distributed import Client, LocalCluster
from arboreto.utils import load_tf_names
from arboreto.algo import grnboost2

if __name__ == '__main__':

    in_file  = 'exp.tsv'
    tf_file  = 'tf_transcription_factors.tsv'
    out_file = 'grn_output.tsv'

    ex_matrix = pd.read_csv(in_file, sep='\t')

    tf_names = load_tf_names(tf_file)

    cluster = LocalCluster(
    local_directory='/mnt/may1nov1/u5009/03.scrna/grn_merge_cca_final/dask-workers',  
    memory_limit='64GB'
    )
    client = Client(cluster)

    network = grnboost2(expression_data=ex_matrix,
                        tf_names=tf_names,
                        client_or_address=client)

    network.to_csv(out_file, sep='\t', index=False, header=False)
  
