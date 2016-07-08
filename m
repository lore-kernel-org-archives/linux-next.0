From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-msm tree with the arm tree
Date: Fri, 8 Jul 2016 12:09:29 +1000
Message-ID: <20160708120929.6aa0d3a7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33984 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753538AbcGHCJc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2016 22:09:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Clark <robdclark@gmail.com>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>

Hi Rob,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_drv.c

between commit:

  062993b15e8e ("drm: convert DT component matching to component_match_add_release()")

from the arm tree and commits:

  1e6753864384 ("drm/msm: Add display components by parsing MDP ports")
  6349b525a80c ("drm/msm: Add components for MDP5")
  9e1f4cc440be ("drm/msm: Drop the gpu binding")

from the drm-msm tree.

I fixed it up (see below - I think this is correct) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/msm_drv.c
index 2bd874787256,a78c33c5f49c..000000000000
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@@ -195,8 -205,12 +205,10 @@@ static int msm_drm_uninit(struct devic
  		kfree(vbl_ev);
  	}
  
+ 	msm_gem_shrinker_cleanup(ddev);
+ 
  	drm_kms_helper_poll_fini(ddev);
  
 -	drm_connector_unregister_all(ddev);
 -
  	drm_dev_unregister(ddev);
  
  #ifdef CONFIG_DRM_FBDEV_EMULATION
@@@ -796,28 -868,146 +859,149 @@@ static int compare_of(struct device *de
  	return dev->of_node == data;
  }
  
 +static void release_of(struct device *dev, void *data)
 +{
 +	of_node_put(data);
 +}
 +
- static int add_components(struct device *dev, struct component_match **matchptr,
- 		const char *name)
+ /*
+  * Identify what components need to be added by parsing what remote-endpoints
+  * our MDP output ports are connected to. In the case of LVDS on MDP4, there
+  * is no external component that we need to add since LVDS is within MDP4
+  * itself.
+  */
+ static int add_components_mdp(struct device *mdp_dev,
+ 			      struct component_match **matchptr)
  {
- 	struct device_node *np = dev->of_node;
- 	unsigned i;
+ 	struct device_node *np = mdp_dev->of_node;
+ 	struct device_node *ep_node;
+ 	struct device *master_dev;
+ 
+ 	/*
+ 	 * on MDP4 based platforms, the MDP platform device is the component
+ 	 * master that adds other display interface components to itself.
+ 	 *
+ 	 * on MDP5 based platforms, the MDSS platform device is the component
+ 	 * master that adds MDP5 and other display interface components to
+ 	 * itself.
+ 	 */
+ 	if (of_device_is_compatible(np, "qcom,mdp4"))
+ 		master_dev = mdp_dev;
+ 	else
+ 		master_dev = mdp_dev->parent;
  
- 	for (i = 0; ; i++) {
- 		struct device_node *node;
+ 	for_each_endpoint_of_node(np, ep_node) {
+ 		struct device_node *intf;
+ 		struct of_endpoint ep;
+ 		int ret;
  
- 		node = of_parse_phandle(np, name, i);
- 		if (!node)
- 			break;
+ 		ret = of_graph_parse_endpoint(ep_node, &ep);
+ 		if (ret) {
+ 			dev_err(mdp_dev, "unable to parse port endpoint\n");
+ 			of_node_put(ep_node);
+ 			return ret;
+ 		}
+ 
+ 		/*
+ 		 * The LCDC/LVDS port on MDP4 is a speacial case where the
+ 		 * remote-endpoint isn't a component that we need to add
+ 		 */
+ 		if (of_device_is_compatible(np, "qcom,mdp4") &&
+ 		    ep.port == 0) {
+ 			of_node_put(ep_node);
+ 			continue;
+ 		}
+ 
+ 		/*
+ 		 * It's okay if some of the ports don't have a remote endpoint
+ 		 * specified. It just means that the port isn't connected to
+ 		 * any external interface.
+ 		 */
+ 		intf = of_graph_get_remote_port_parent(ep_node);
+ 		if (!intf) {
+ 			of_node_put(ep_node);
+ 			continue;
+ 		}
+ 
 -		component_match_add(master_dev, matchptr, compare_of, intf);
++		component_match_add_release(master_dev, matchptr, release_of,
++					    compare_of, intf);
+ 
 -		of_node_put(intf);
+ 		of_node_put(ep_node);
+ 	}
+ 
+ 	return 0;
+ }
+ 
+ static int compare_name_mdp(struct device *dev, void *data)
+ {
+ 	return (strstr(dev_name(dev), "mdp") != NULL);
+ }
+ 
+ static int add_display_components(struct device *dev,
+ 				  struct component_match **matchptr)
+ {
+ 	struct device *mdp_dev;
+ 	int ret;
+ 
+ 	/*
+ 	 * MDP5 based devices don't have a flat hierarchy. There is a top level
+ 	 * parent: MDSS, and children: MDP5, DSI, HDMI, eDP etc. Populate the
+ 	 * children devices, find the MDP5 node, and then add the interfaces
+ 	 * to our components list.
+ 	 */
+ 	if (of_device_is_compatible(dev->of_node, "qcom,mdss")) {
+ 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+ 		if (ret) {
+ 			dev_err(dev, "failed to populate children devices\n");
+ 			return ret;
+ 		}
  
+ 		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+ 		if (!mdp_dev) {
+ 			dev_err(dev, "failed to find MDSS MDP node\n");
+ 			of_platform_depopulate(dev);
+ 			return -ENODEV;
+ 		}
+ 
+ 		put_device(mdp_dev);
+ 
+ 		/* add the MDP component itself */
 -		component_match_add(dev, matchptr, compare_of,
 -				    mdp_dev->of_node);
 +		component_match_add_release(dev, matchptr, release_of,
- 					    compare_of, node);
++					    compare_of, mdp_dev->of_node);
+ 	} else {
+ 		/* MDP4 */
+ 		mdp_dev = dev;
  	}
  
+ 	ret = add_components_mdp(mdp_dev, matchptr);
+ 	if (ret)
+ 		of_platform_depopulate(dev);
+ 
+ 	return ret;
+ }
+ 
+ /*
+  * We don't know what's the best binding to link the gpu with the drm device.
+  * Fow now, we just hunt for all the possible gpus that we support, and add them
+  * as components.
+  */
+ static const struct of_device_id msm_gpu_match[] = {
+ 	{ .compatible = "qcom,adreno-3xx" },
+ 	{ .compatible = "qcom,kgsl-3d0" },
+ 	{ },
+ };
+ 
+ static int add_gpu_components(struct device *dev,
+ 			      struct component_match **matchptr)
+ {
+ 	struct device_node *np;
+ 
+ 	np = of_find_matching_node(NULL, msm_gpu_match);
+ 	if (!np)
+ 		return 0;
+ 
 -	of_node_put(np);
 -
 -	component_match_add(dev, matchptr, compare_of, np);
++	component_match_add_release(dev, matchptr, release_of, compare_of, np);
+ 
  	return 0;
  }
  
