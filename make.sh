#!/bin/sh

PATCH_FILE=patch.diff

diff -u hdbscan/hdbscan/_hdbscan_boruvka.pyx scikit-learn/sklearn/cluster/_hdbscan/_hdbscan_boruvka.pyx > $PATCH_FILE
diff -u hdbscan/hdbscan/_hdbscan_linkage.pyx scikit-learn/sklearn/cluster/_hdbscan/_hdbscan_linkage.pyx  >> $PATCH_FILE
diff -u hdbscan/hdbscan/_hdbscan_reachability.pyx scikit-learn/sklearn/cluster/_hdbscan/_hdbscan_reachability.pyx >> $PATCH_FILE
diff -u hdbscan/hdbscan/_hdbscan_tree.pyx scikit-learn/sklearn/cluster/_hdbscan/_hdbscan_tree.pyx >> $PATCH_FILE
diff -u hdbscan/hdbscan/hdbscan_.py scikit-learn/sklearn/cluster/_hdbscan/hdbscan_.py >> $PATCH_FILE

diff2html -i file -F index_raw.html -- $PATCH_FILE

# Have "Files changed open by default"
sed 's/fileListToggle(false)/fileListToggle(true)/' index_raw.html > index.html
rm index_raw.html
