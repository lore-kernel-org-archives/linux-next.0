From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the rdma tree with the net-next tree
Date: Mon, 15 Jun 2015 18:12:53 +1000
Message-ID: <1434355973.19706.6.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Majd Dibbiny <majd@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Matan Barak <matanb@mellanox.com>Or Gerlitz <ogerlitz@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi Doug,

Today's linux-next merge of the rdma tree got a conflict in
drivers/infiniband/hw/mlx5/main.c between commit 1b5daf11b015 "IB/mlx5: Avoid
using the MAD_IFC command under ISSI > 0 mode" from the net-next tree and
commit 2528e33e6809 "IB/core: Pass hardware specific data in query_device" from
the rdma tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/infiniband/hw/mlx5/main.c
index 79dadd627e9c,c6cb26e0c866..000000000000
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@@ -63,168 -62,36 +63,172 @@@ static char mlx5_version[] 
  	DRIVER_NAME ": Mellanox Connect-IB Infiniband driver v"
  	DRIVER_VERSION " (" DRIVER_RELDATE ")\n";
  
 +static enum rdma_link_layer
 +mlx5_ib_port_link_layer(struct ib_device *device)
 +{
 +	struct mlx5_ib_dev *dev = to_mdev(device);
 +
 +	switch (MLX5_CAP_GEN(dev->mdev, port_type)) {
 +	case MLX5_CAP_PORT_TYPE_IB:
 +		return IB_LINK_LAYER_INFINIBAND;
 +	case MLX5_CAP_PORT_TYPE_ETH:
 +		return IB_LINK_LAYER_ETHERNET;
 +	default:
 +		return IB_LINK_LAYER_UNSPECIFIED;
 +	}
 +}
 +
 +static int mlx5_use_mad_ifc(struct mlx5_ib_dev *dev)
 +{
 +	return !dev->mdev->issi;
 +}
 +
 +enum {
 +	MLX5_VPORT_ACCESS_METHOD_MAD,
 +	MLX5_VPORT_ACCESS_METHOD_HCA,
 +	MLX5_VPORT_ACCESS_METHOD_NIC,
 +};
 +
 +static int mlx5_get_vport_access_method(struct ib_device *ibdev)
 +{
 +	if (mlx5_use_mad_ifc(to_mdev(ibdev)))
 +		return MLX5_VPORT_ACCESS_METHOD_MAD;
 +
 +	if (mlx5_ib_port_link_layer(ibdev) ==
 +	    IB_LINK_LAYER_ETHERNET)
 +		return MLX5_VPORT_ACCESS_METHOD_NIC;
 +
 +	return MLX5_VPORT_ACCESS_METHOD_HCA;
 +}
 +
 +static int mlx5_query_system_image_guid(struct ib_device *ibdev,
 +					__be64 *sys_image_guid)
 +{
 +	struct mlx5_ib_dev *dev = to_mdev(ibdev);
 +	struct mlx5_core_dev *mdev = dev->mdev;
 +	u64 tmp;
 +	int err;
 +
 +	switch (mlx5_get_vport_access_method(ibdev)) {
 +	case MLX5_VPORT_ACCESS_METHOD_MAD:
 +		return mlx5_query_mad_ifc_system_image_guid(ibdev,
 +							    sys_image_guid);
 +
 +	case MLX5_VPORT_ACCESS_METHOD_HCA:
 +		err = mlx5_query_hca_vport_system_image_guid(mdev, &tmp);
 +		if (!err)
 +			*sys_image_guid = cpu_to_be64(tmp);
 +		return err;
 +
 +	default:
 +		return -EINVAL;
 +	}
 +}
 +
 +static int mlx5_query_max_pkeys(struct ib_device *ibdev,
 +				u16 *max_pkeys)
 +{
 +	struct mlx5_ib_dev *dev = to_mdev(ibdev);
 +	struct mlx5_core_dev *mdev = dev->mdev;
 +
 +	switch (mlx5_get_vport_access_method(ibdev)) {
 +	case MLX5_VPORT_ACCESS_METHOD_MAD:
 +		return mlx5_query_mad_ifc_max_pkeys(ibdev, max_pkeys);
 +
 +	case MLX5_VPORT_ACCESS_METHOD_HCA:
 +	case MLX5_VPORT_ACCESS_METHOD_NIC:
 +		*max_pkeys = mlx5_to_sw_pkey_sz(MLX5_CAP_GEN(mdev,
 +						pkey_table_size));
 +		return 0;
 +
 +	default:
 +		return -EINVAL;
 +	}
 +}
 +
 +static int mlx5_query_vendor_id(struct ib_device *ibdev,
 +				u32 *vendor_id)
 +{
 +	struct mlx5_ib_dev *dev = to_mdev(ibdev);
 +
 +	switch (mlx5_get_vport_access_method(ibdev)) {
 +	case MLX5_VPORT_ACCESS_METHOD_MAD:
 +		return mlx5_query_mad_ifc_vendor_id(ibdev, vendor_id);
 +
 +	case MLX5_VPORT_ACCESS_METHOD_HCA:
 +	case MLX5_VPORT_ACCESS_METHOD_NIC:
 +		return mlx5_core_query_vendor_id(dev->mdev, vendor_id);
 +
 +	default:
 +		return -EINVAL;
 +	}
 +}
 +
 +static int mlx5_query_node_guid(struct mlx5_ib_dev *dev,
 +				__be64 *node_guid)
 +{
 +	u64 tmp;
 +	int err;
 +
 +	switch (mlx5_get_vport_access_method(&dev->ib_dev)) {
 +	case MLX5_VPORT_ACCESS_METHOD_MAD:
 +		return mlx5_query_mad_ifc_node_guid(dev, node_guid);
 +
 +	case MLX5_VPORT_ACCESS_METHOD_HCA:
 +		err = mlx5_query_hca_vport_node_guid(dev->mdev, &tmp);
 +		if (!err)
 +			*node_guid = cpu_to_be64(tmp);
 +		return err;
 +
 +	default:
 +		return -EINVAL;
 +	}
 +}
 +
 +struct mlx5_reg_node_desc {
 +	u8	desc[64];
 +};
 +
 +static int mlx5_query_node_desc(struct mlx5_ib_dev *dev, char *node_desc)
 +{
 +	struct mlx5_reg_node_desc in;
 +
 +	if (mlx5_use_mad_ifc(dev))
 +		return mlx5_query_mad_ifc_node_desc(dev, node_desc);
 +
 +	memset(&in, 0, sizeof(in));
 +
 +	return mlx5_core_access_reg(dev->mdev, &in, sizeof(in), node_desc,
 +				    sizeof(struct mlx5_reg_node_desc),
 +				    MLX5_REG_NODE_DESC, 0, 0);
 +}
 +
  static int mlx5_ib_query_device(struct ib_device *ibdev,
- 				struct ib_device_attr *props)
+ 				struct ib_device_attr *props,
+ 				struct ib_udata *uhw)
  {
  	struct mlx5_ib_dev *dev = to_mdev(ibdev);
 -	struct ib_smp *in_mad  = NULL;
 -	struct ib_smp *out_mad = NULL;
 -	struct mlx5_general_caps *gen;
 +	struct mlx5_core_dev *mdev = dev->mdev;
  	int err = -ENOMEM;
  	int max_rq_sg;
  	int max_sq_sg;
 -	u64 flags;
  
+ 	if (uhw->inlen || uhw->outlen)
+ 		return -EINVAL;
+ 
 -	gen = &dev->mdev->caps.gen;
 -	in_mad  = kzalloc(sizeof(*in_mad), GFP_KERNEL);
 -	out_mad = kmalloc(sizeof(*out_mad), GFP_KERNEL);
 -	if (!in_mad || !out_mad)
 -		goto out;
 -
 -	init_query_mad(in_mad);
 -	in_mad->attr_id = IB_SMP_ATTR_NODE_INFO;
 +	memset(props, 0, sizeof(*props));
 +	err = mlx5_query_system_image_guid(ibdev,
 +					   &props->sys_image_guid);
 +	if (err)
 +		return err;
  
 -	err = mlx5_MAD_IFC(to_mdev(ibdev), 1, 1, 1, NULL, NULL, in_mad, out_mad);
 +	err = mlx5_query_max_pkeys(ibdev, &props->max_pkeys);
  	if (err)
 -		goto out;
 +		return err;
  
 -	memset(props, 0, sizeof(*props));
 +	err = mlx5_query_vendor_id(ibdev, &props->vendor_id);
 +	if (err)
 +		return err;
  
  	props->fw_ver = ((u64)fw_rev_maj(dev->mdev) << 32) |
  		(fw_rev_min(dev->mdev) << 16) |
@@@ -1067,9 -911,12 +1071,10 @@@ static int get_port_caps(struct mlx5_ib
  {
  	struct ib_device_attr *dprops = NULL;
  	struct ib_port_attr *pprops = NULL;
 -	struct mlx5_general_caps *gen;
  	int err = -ENOMEM;
  	int port;
+ 	struct ib_udata uhw = {.inlen = 0, .outlen = 0};
  
 -	gen = &dev->mdev->caps.gen;
  	pprops = kmalloc(sizeof(*pprops), GFP_KERNEL);
  	if (!pprops)
  		goto out;
@@@ -1473,10 -1311,11 +1499,11 @@@ static void *mlx5_ib_add(struct mlx5_co
  	dev->ib_dev.alloc_fast_reg_page_list = mlx5_ib_alloc_fast_reg_page_list;
  	dev->ib_dev.free_fast_reg_page_list  = mlx5_ib_free_fast_reg_page_list;
  	dev->ib_dev.check_mr_status	= mlx5_ib_check_mr_status;
+ 	dev->ib_dev.get_port_immutable  = mlx5_port_immutable;
  
 -	mlx5_ib_internal_query_odp_caps(dev);
 +	mlx5_ib_internal_fill_odp_caps(dev);
  
 -	if (mdev->caps.gen.flags & MLX5_DEV_CAP_FLAG_XRC) {
 +	if (MLX5_CAP_GEN(mdev, xrc)) {
  		dev->ib_dev.alloc_xrcd = mlx5_ib_alloc_xrcd;
  		dev->ib_dev.dealloc_xrcd = mlx5_ib_dealloc_xrcd;
  		dev->ib_dev.uverbs_cmd_mask |=
