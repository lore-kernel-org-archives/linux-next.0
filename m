From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with the sound-asoc
 tree
Date: Wed, 14 Jun 2017 12:54:23 +1000
Message-ID: <20170614125423.48266e23@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  drivers/of/base.c

between commits:

  4c9c3d595f1b ("of_graph: add of_graph_get_remote_endpoint()")
  0ef472a973eb ("of_graph: add of_graph_get_port_parent()")
  ac1e6958d3be ("of_graph: add of_graph_get_endpoint_count()")

from the sound-asoc tree and commit:

  1df09bc66f9b ("of: Move OF property and graph API from base.c to property.c")

from the devicetree tree.

I fixed it up (I used the latter version of drivers/of/base.c and then
added the patch below) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Jun 2017 12:45:29 +1000
Subject: [PATCH] of_graph: merge fix up for creating of drivers/of/property.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/of/property.c | 60 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 457c313a8924..07c7c36c5ca8 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -684,6 +684,41 @@ struct device_node *of_graph_get_endpoint_by_regs(
 EXPORT_SYMBOL(of_graph_get_endpoint_by_regs);
 
 /**
+ * of_graph_get_remote_endpoint() - get remote endpoint node
+ * @node: pointer to a local endpoint device_node
+ *
+ * Return: Remote endpoint node associated with remote endpoint node linked
+ *	   to @node. Use of_node_put() on it when done.
+ */
+struct device_node *of_graph_get_remote_endpoint(const struct device_node *node)
+{
+	/* Get remote endpoint node. */
+	return of_parse_phandle(node, "remote-endpoint", 0);
+}
+EXPORT_SYMBOL(of_graph_get_remote_endpoint);
+
+/**
+ * of_graph_get_port_parent() - get port's parent node
+ * @node: pointer to a local endpoint device_node
+ *
+ * Return: device node associated with endpoint node linked
+ *	   to @node. Use of_node_put() on it when done.
+ */
+struct device_node *of_graph_get_port_parent(struct device_node *node)
+{
+	unsigned int depth;
+
+	/* Walk 3 levels up only if there is 'ports' node. */
+	for (depth = 3; depth && node; depth--) {
+		node = of_get_next_parent(node);
+		if (depth == 2 && of_node_cmp(node->name, "ports"))
+			break;
+	}
+	return node;
+}
+EXPORT_SYMBOL(of_graph_get_port_parent);
+
+/**
  * of_graph_get_remote_port_parent() - get remote port's parent node
  * @node: pointer to a local endpoint device_node
  *
@@ -694,18 +729,11 @@ struct device_node *of_graph_get_remote_port_parent(
 			       const struct device_node *node)
 {
 	struct device_node *np;
-	unsigned int depth;
 
 	/* Get remote endpoint node. */
-	np = of_parse_phandle(node, "remote-endpoint", 0);
+	np = of_graph_get_remote_endpoint(node);
 
-	/* Walk 3 levels up only if there is 'ports' node. */
-	for (depth = 3; depth && np; depth--) {
-		np = of_get_next_parent(np);
-		if (depth == 2 && of_node_cmp(np->name, "ports"))
-			break;
-	}
-	return np;
+	return of_graph_get_port_parent(np);
 }
 EXPORT_SYMBOL(of_graph_get_remote_port_parent);
 
@@ -721,13 +749,25 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
 	struct device_node *np;
 
 	/* Get remote endpoint node. */
-	np = of_parse_phandle(node, "remote-endpoint", 0);
+	np = of_graph_get_remote_endpoint(node);
 	if (!np)
 		return NULL;
 	return of_get_next_parent(np);
 }
 EXPORT_SYMBOL(of_graph_get_remote_port);
 
+int of_graph_get_endpoint_count(const struct device_node *np)
+{
+	struct device_node *endpoint;
+	int num = 0;
+
+	for_each_endpoint_of_node(np, endpoint)
+		num++;
+
+	return num;
+}
+EXPORT_SYMBOL(of_graph_get_endpoint_count);
+
 /**
  * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
  * @node: pointer to parent device_node containing graph port/endpoint
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
