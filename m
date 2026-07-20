Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B59742F6F6;
	Mon, 20 Jul 2026 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558639; cv=none; b=hosKGEVUCCyhOBJ3kLK/Ux54OkbJjBWdiHQXsZ/THGaJsLcpdTQaAEturf9DVW+voIwZln9vO/tdHDpF15ggSwXyTHehzIT9S8Hu71iXkpK0mveSefCA5yap7V10XzNkeGDpCICABvlxxleH8TOqxLlKH61eSgAfCBSeoNzSUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558639; c=relaxed/simple;
	bh=PWzgRxGHLMYTmPI10SztgchubdrEa6gnC/VX1PJCJ1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iV261SgYt7RGkWoQF3enbPyIj7lYUM+1KEhL5CYjlyOXq3nJQ5fvPjLfOhiCoLKOxNvu2gRydUbYUaJawkOIxJs8C1Q8GfZ08q2CdLs/8cCwxI+cCDKWESWGoYxtRKbxtYqBzooT2cDNLC884RE1ZTtKmirN0cP8MopTj6NM7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaegjiJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaegjiJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B35C1F000E9;
	Mon, 20 Jul 2026 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558637;
	bh=cmE8wrXfL2dy4MoxlWIrDxuVyEhGhUfppgWxPOEO1/s=;
	h=Date:From:To:Cc:Subject;
	b=TaegjiJbTvryTT44m2JjZXcRlNuWs/c3dIUNSy+wD+DmuE9/pyK27H74YJc3Dswqz
	 eFRiVqoTC2os/ZLlJeNi4NzMv45IzP6eTjKdqB4Wji8QR2gl5OFcj2X5EEAqFcKNdT
	 jKJC6RuWJxIMxAACjqapACavjGWqH/DKQ0Cs86CkX8eHapTxvK4sMsp18WzrzYh+oX
	 qN/Pusv13mDeGq81EjdF0YOeFj3A95TXWwJIiviXCxuRVR+fJ11V7OwaQMqrVZiF17
	 cgqSbpwuEJmpeOU71XHmtlHiV+pDYaJjDiY5Ro28Grc85BgzMbbt5aCIhntSoRE8dW
	 omkazLj2VGrDQ==
Date: Mon, 20 Jul 2026 15:43:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Jacob Moroni <jmoroni@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with the origin tree
Message-ID: <al40KAaJ0Qiy-lTs@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7TKuuBEeLHIP6Or3"
Content-Disposition: inline


--7TKuuBEeLHIP6Or3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/irdma/verbs.c

between commit:

  b9b0889071569 ("RDMA/irdma: Prevent user-triggered null deref on QP creat=
e")

=66rom the origin tree and commit:

  d83bf998f719d ("RDMA/irdma: Prevent user-triggered null deref on QP creat=
e")

=66rom the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/infiniband/hw/irdma/verbs.c
index b7388b41ed958,16c80367270f5..0000000000000
--- a/drivers/infiniband/hw/irdma/verbs.c
+++ b/drivers/infiniband/hw/irdma/verbs.c
@@@ -18,11 -18,10 +18,10 @@@ static int irdma_query_device(struct ib
  	struct irdma_hw_attrs *hw_attrs =3D &rf->sc_dev.hw_attrs;
  	int err;
 =20
- 	err =3D ib_is_udata_in_empty(udata);
+ 	err =3D ib_no_udata_io(udata);
  	if (err)
  		return err;
 =20
- 	memset(props, 0, sizeof(*props));
  	addrconf_addr_eui48((u8 *)&props->sys_image_guid,
  			    iwdev->netdev->dev_addr);
  	props->fw_ver =3D (u64)irdma_fw_major_ver(&rf->sc_dev) << 32 |
@@@ -76,7 -75,7 +75,7 @@@
  	if (hw_attrs->uk_attrs.hw_rev >=3D IRDMA_GEN_3)
  		props->device_cap_flags |=3D IB_DEVICE_MEM_WINDOW_TYPE_2B;
 =20
- 	return ib_respond_empty_udata(udata);
+ 	return 0;
  }
 =20
  /**
@@@ -407,6 -406,10 +406,10 @@@ static int irdma_alloc_pd(struct ib_pd=20
  	u32 pd_id =3D 0;
  	int err;
 =20
+ 	err =3D ib_is_udata_in_empty(udata);
+ 	if (err)
+ 		return err;
+=20
  	if (udata && udata->outlen < IRDMA_ALLOC_PD_MIN_RESP_LEN)
  		return -EINVAL;
 =20
@@@ -445,6 -448,11 +448,11 @@@ static int irdma_dealloc_pd(struct ib_p
  {
  	struct irdma_pd *iwpd =3D to_iwpd(ibpd);
  	struct irdma_device *iwdev =3D to_iwdev(ibpd->device);
+ 	int ret;
+=20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ret;
 =20
  	irdma_free_rsrc(iwdev->rf, iwdev->rf->allocated_pds, iwpd->sc_pd.pd_id);
 =20
@@@ -464,6 -472,9 +472,9 @@@ static struct irdma_pbl *irdma_get_pbl(
 =20
  	list_for_each_entry (iwpbl, pbl_list, list) {
  		if (iwpbl->user_base =3D=3D va) {
+ 			struct irdma_mr *iwmr =3D iwpbl->iwmr;
+=20
+ 			refcount_inc(&iwmr->user_ring_refs);
  			list_del(&iwpbl->list);
  			iwpbl->on_list =3D false;
  			return iwpbl;
@@@ -534,11 -545,10 +545,10 @@@ static int irdma_setup_push_mmap_entrie
  }
 =20
  /**
-  * irdma_destroy_qp - destroy qp
+  * _irdma_destroy_qp - destroy qp
   * @ibqp: qp's ib pointer also to get to device's qp address
-  * @udata: user data
   */
- static int irdma_destroy_qp(struct ib_qp *ibqp, struct ib_udata *udata)
+ static void _irdma_destroy_qp(struct ib_qp *ibqp)
  {
  	struct irdma_qp *iwqp =3D to_iwqp(ibqp);
  	struct irdma_device *iwdev =3D iwqp->iwdev;
@@@ -570,6 -580,22 +580,22 @@@
  	if (iwqp->sc_qp.qp_uk.qp_id =3D=3D 1)
  		iwdev->rf->hwqp1_rsvd =3D false;
  	irdma_free_qp_rsrc(iwqp);
+ }
+=20
+ /**
+  * irdma_destroy_qp - destroy qp
+  * @ibqp: qp's ib pointer also to get to device's qp address
+  * @udata: user data
+  */
+ static int irdma_destroy_qp(struct ib_qp *ibqp, struct ib_udata *udata)
+ {
+ 	int ret;
+=20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ret;
+=20
+ 	_irdma_destroy_qp(ibqp);
 =20
  	return 0;
  }
@@@ -605,37 -631,29 +631,29 @@@ static void irdma_setup_virt_qp(struct=20
 =20
  /**
   * irdma_setup_umode_qp - setup sq and rq size in user mode qp
-  * @udata: udata
+  * @ucontext: user context
+  * @req: user request pointer
   * @iwdev: iwarp device
   * @iwqp: qp ptr (user or kernel)
   * @info: initialize info to return
   * @init_attr: Initial QP create attributes
   */
- static int irdma_setup_umode_qp(struct ib_udata *udata,
+ static int irdma_setup_umode_qp(struct irdma_ucontext *ucontext,
+ 				struct irdma_create_qp_req *req,
  				struct irdma_device *iwdev,
  				struct irdma_qp *iwqp,
  				struct irdma_qp_init_info *info,
  				struct ib_qp_init_attr *init_attr)
  {
- 	struct irdma_ucontext *ucontext =3D rdma_udata_to_drv_context(udata,
- 				struct irdma_ucontext, ibucontext);
  	struct irdma_qp_uk_init_info *ukinfo =3D &info->qp_uk_init_info;
- 	struct irdma_create_qp_req req;
  	unsigned long flags;
  	int ret;
 =20
- 	ret =3D ib_copy_from_udata(&req, udata,
- 				 min(sizeof(req), udata->inlen));
- 	if (ret) {
- 		ibdev_dbg(&iwdev->ibdev, "VERBS: ib_copy_from_data fail\n");
- 		return ret;
- 	}
-=20
- 	iwqp->ctx_info.qp_compl_ctx =3D req.user_compl_ctx;
+ 	iwqp->ctx_info.qp_compl_ctx =3D req->user_compl_ctx;
  	iwqp->user_mode =3D 1;
 =20
  	spin_lock_irqsave(&ucontext->qp_reg_mem_list_lock, flags);
- 	iwqp->iwpbl =3D irdma_get_pbl((unsigned long)req.user_wqe_bufs,
+ 	iwqp->iwpbl =3D irdma_get_pbl((unsigned long)req->user_wqe_bufs,
  				    &ucontext->qp_reg_mem_list);
  	spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
 =20
@@@ -962,6 -980,7 +980,7 @@@ static int irdma_create_qp(struct ib_q
  	struct irdma_uk_attrs *uk_attrs =3D &dev->hw_attrs.uk_attrs;
  	struct irdma_qp_init_info init_info =3D {};
  	struct irdma_qp_host_ctx_info *ctx_info;
+ 	struct irdma_create_qp_req ureq =3D {};
  	struct irdma_srq *iwsrq;
  	bool srq_valid =3D false;
  	u32 srq_id =3D 0;
@@@ -979,9 -998,14 +998,14 @@@
  	if (err_code)
  		return err_code;
 =20
- 	if (udata && (udata->inlen < IRDMA_CREATE_QP_MIN_REQ_LEN ||
- 		      udata->outlen < IRDMA_CREATE_QP_MIN_RESP_LEN))
- 		return -EINVAL;
+ 	if (udata) {
+ 		if (udata->outlen < IRDMA_CREATE_QP_MIN_RESP_LEN)
+ 			return -EINVAL;
+=20
+ 		err_code =3D ib_copy_validate_udata_in(udata, ureq, user_compl_ctx);
+ 		if (err_code)
+ 			return err_code;
+ 	}
 =20
  	init_info.vsi =3D &iwdev->vsi;
  	init_info.qp_uk_init_info.uk_attrs =3D uk_attrs;
@@@ -1040,9 -1064,14 +1064,14 @@@
  	init_waitqueue_head(&iwqp->mod_qp_waitq);
 =20
  	if (udata) {
+ 		struct irdma_ucontext *ucontext =3D
+ 			rdma_udata_to_drv_context(udata,
+ 						  struct irdma_ucontext,
+ 						  ibucontext);
+=20
  		init_info.qp_uk_init_info.abi_ver =3D iwpd->sc_pd.abi_ver;
- 		err_code =3D irdma_setup_umode_qp(udata, iwdev, iwqp, &init_info,
- 						init_attr);
+ 		err_code =3D irdma_setup_umode_qp(ucontext, &ureq, iwdev, iwqp,
+ 						&init_info, init_attr);
  	} else {
  		INIT_DELAYED_WORK(&iwqp->dwork_flush, irdma_flush_worker);
  		init_info.qp_uk_init_info.abi_ver =3D IRDMA_ABI_VER;
@@@ -1109,8 -1138,12 +1138,12 @@@
  	init_completion(&iwqp->free_qp);
 =20
  	if (udata) {
- 		/* GEN_1 legacy support with libi40iw does not have expanded uresp stru=
ct */
- 		if (udata->outlen < sizeof(uresp)) {
+ 		/* GEN_1 legacy support with libi40iw does not have expanded
+ 		 * uresp struct. Check for the exact legacy size (20 bytes) to
+ 		 * ensure that newer expanded uresp structs don't accidentally
+ 		 * trigger the legacy fallback.
+ 		 */
+ 		if (udata->outlen =3D=3D IRDMA_CREATE_QP_MIN_RESP_LEN) {
  			uresp.lsmm =3D 1;
  			uresp.push_idx =3D IRDMA_INVALID_PUSH_PAGE_INDEX_GEN_1;
  		} else {
@@@ -1124,7 -1157,7 +1157,7 @@@
 =20
  		err_code =3D ib_respond_udata(udata, uresp);
  		if (err_code) {
- 			irdma_destroy_qp(&iwqp->ibqp, udata);
+ 			_irdma_destroy_qp(&iwqp->ibqp);
  			return err_code;
  		}
  	}
@@@ -1273,7 -1306,6 +1306,6 @@@ static int irdma_wait_for_suspend(struc
  int irdma_modify_qp_roce(struct ib_qp *ibqp, struct ib_qp_attr *attr,
  			 int attr_mask, struct ib_udata *udata)
  {
- #define IRDMA_MODIFY_QP_MIN_REQ_LEN offsetofend(struct irdma_modify_qp_re=
q, rq_flush)
  #define IRDMA_MODIFY_QP_MIN_RESP_LEN offsetofend(struct irdma_modify_qp_r=
esp, push_valid)
  	struct irdma_pd *iwpd =3D to_iwpd(ibqp->pd);
  	struct irdma_qp *iwqp =3D to_iwqp(ibqp);
@@@ -1289,15 -1321,26 +1321,26 @@@
  	u8 issue_modify_qp =3D 0;
  	int ret =3D 0;
 =20
+ 	/* Clear the response buffer (if any). It may be updated again later. */
+ 	ret =3D ib_respond_empty_udata(udata);
+ 	if (ret)
+ 		return ret;
+=20
  	ctx_info =3D &iwqp->ctx_info;
  	roce_info =3D &iwqp->roce_info;
  	udp_info =3D &iwqp->udp_info;
 =20
  	if (udata) {
  		/* udata inlen/outlen can be 0 when supporting legacy libi40iw */
- 		if ((udata->inlen && udata->inlen < IRDMA_MODIFY_QP_MIN_REQ_LEN) ||
- 		    (udata->outlen && udata->outlen < IRDMA_MODIFY_QP_MIN_RESP_LEN))
+ 		if (udata->outlen && udata->outlen < IRDMA_MODIFY_QP_MIN_RESP_LEN)
  			return -EINVAL;
+=20
+ 		/* For current irdma, validate against ABI def. */
+ 		if (udata->inlen) {
+ 			ret =3D ib_copy_validate_udata_in(udata, ureq, rsvd);
+ 			if (ret)
+ 				return ret;
+ 		}
  	}
 =20
  	if (attr_mask & ~IB_QP_ATTR_STANDARD_BITS)
@@@ -1540,10 -1583,6 +1583,6 @@@
  				iwqp->ibqp_state =3D attr->qp_state;
  				spin_unlock_irqrestore(&iwqp->lock, flags);
  				if (udata && udata->inlen) {
- 					if (ib_copy_from_udata(&ureq, udata,
- 					    min(sizeof(ureq), udata->inlen)))
- 						return -EINVAL;
-=20
  					irdma_flush_wqes(iwqp,
  					    (ureq.sq_flush ? IRDMA_FLUSH_SQ : 0) |
  					    (ureq.rq_flush ? IRDMA_FLUSH_RQ : 0) |
@@@ -1633,7 -1672,6 +1672,6 @@@ exit
  int irdma_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr, int attr=
_mask,
  		    struct ib_udata *udata)
  {
- #define IRDMA_MODIFY_QP_MIN_REQ_LEN offsetofend(struct irdma_modify_qp_re=
q, rq_flush)
  #define IRDMA_MODIFY_QP_MIN_RESP_LEN offsetofend(struct irdma_modify_qp_r=
esp, push_valid)
  	struct irdma_qp *iwqp =3D to_iwqp(ibqp);
  	struct irdma_device *iwdev =3D iwqp->iwdev;
@@@ -1649,11 -1687,20 +1687,20 @@@
  	int err;
  	unsigned long flags;
 =20
+ 	err =3D ib_respond_empty_udata(udata);
+ 	if (err)
+ 		return err;
+=20
  	if (udata) {
  		/* udata inlen/outlen can be 0 when supporting legacy libi40iw */
- 		if ((udata->inlen && udata->inlen < IRDMA_MODIFY_QP_MIN_REQ_LEN) ||
- 		    (udata->outlen && udata->outlen < IRDMA_MODIFY_QP_MIN_RESP_LEN))
+ 		if (udata->outlen && udata->outlen < IRDMA_MODIFY_QP_MIN_RESP_LEN)
  			return -EINVAL;
+=20
+ 		if (udata->inlen) {
+ 			err =3D ib_copy_validate_udata_in(udata, ureq, rsvd);
+ 			if (err)
+ 				return err;
+ 		}
  	}
 =20
  	if (attr_mask & ~IB_QP_ATTR_STANDARD_BITS)
@@@ -1743,10 -1790,6 +1790,6 @@@
  				iwqp->ibqp_state =3D attr->qp_state;
  				spin_unlock_irqrestore(&iwqp->lock, flags);
  				if (udata && udata->inlen) {
- 					if (ib_copy_from_udata(&ureq, udata,
- 					    min(sizeof(ureq), udata->inlen)))
- 						return -EINVAL;
-=20
  					irdma_flush_wqes(iwqp,
  					    (ureq.sq_flush ? IRDMA_FLUSH_SQ : 0) |
  					    (ureq.rq_flush ? IRDMA_FLUSH_RQ : 0) |
@@@ -1880,6 -1923,11 +1923,11 @@@ static void irdma_srq_free_rsrc(struct=20
  		dma_free_coherent(rf->sc_dev.hw->device, iwsrq->kmem.size,
  				  iwsrq->kmem.va, iwsrq->kmem.pa);
  		iwsrq->kmem.va =3D NULL;
+ 	} else {
+ 		/* Not called in any failure path, so iwpbl is valid. */
+ 		struct irdma_mr *iwmr =3D iwsrq->iwpbl->iwmr;
+=20
+ 		refcount_dec(&iwmr->user_ring_refs);
  	}
 =20
  	irdma_free_rsrc(rf, rf->allocated_srqs, srq->srq_uk.srq_id);
@@@ -1902,6 -1950,21 +1950,21 @@@ static void irdma_cq_free_rsrc(struct i
  				  iwcq->kmem_shadow.size,
  				  iwcq->kmem_shadow.va, iwcq->kmem_shadow.pa);
  		iwcq->kmem_shadow.va =3D NULL;
+ 	} else {
+ 		struct irdma_mr *iwmr;
+=20
+ 		/* May be called in a failure path before iwpbl is valid. */
+ 		if (iwcq->iwpbl) {
+ 			iwmr =3D iwcq->iwpbl->iwmr;
+=20
+ 			refcount_dec(&iwmr->user_ring_refs);
+ 		}
+=20
+ 		if (iwcq->iwpbl_shadow) {
+ 			iwmr =3D iwcq->iwpbl_shadow->iwmr;
+=20
+ 			refcount_dec(&iwmr->user_ring_refs);
+ 		}
  	}
 =20
  	irdma_free_rsrc(rf, rf->allocated_cqs, cq->cq_uk.cq_id);
@@@ -1958,6 -2021,11 +2021,11 @@@ static int irdma_destroy_srq(struct ib_
  	struct irdma_device *iwdev =3D to_iwdev(ibsrq->device);
  	struct irdma_srq *iwsrq =3D to_iwsrq(ibsrq);
  	struct irdma_sc_srq *srq =3D &iwsrq->sc_srq;
+ 	int ret;
+=20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ret;
 =20
  	irdma_srq_wq_destroy(iwdev->rf, srq);
  	irdma_srq_free_rsrc(iwdev->rf, iwsrq);
@@@ -1978,6 -2046,11 +2046,11 @@@ static int irdma_destroy_cq(struct ib_c
  	struct irdma_sc_ceq *ceq =3D dev->ceq[cq->ceq_id];
  	struct irdma_ceq *iwceq =3D container_of(ceq, struct irdma_ceq, sc_ceq);
  	unsigned long flags;
+ 	int ret;
+=20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ret;
 =20
  	spin_lock_irqsave(&iwcq->lock, flags);
  	if (!list_empty(&iwcq->cmpl_generated))
@@@ -2008,7 -2081,6 +2081,6 @@@
  static int irdma_resize_cq(struct ib_cq *ibcq, unsigned int entries,
  			   struct ib_udata *udata)
  {
- #define IRDMA_RESIZE_CQ_MIN_REQ_LEN offsetofend(struct irdma_resize_cq_re=
q, user_cq_buffer)
  	struct irdma_cq *iwcq =3D to_iwcq(ibcq);
  	struct irdma_sc_dev *dev =3D iwcq->sc_cq.dev;
  	struct irdma_cqp_request *cqp_request;
@@@ -2017,7 -2089,7 +2089,7 @@@
  	struct irdma_modify_cq_info info =3D {};
  	struct irdma_dma_mem kmem_buf;
  	struct irdma_cq_mr *cqmr_buf;
- 	struct irdma_pbl *iwpbl_buf;
+ 	struct irdma_pbl *iwpbl_buf =3D NULL;
  	struct irdma_device *iwdev;
  	struct irdma_pci_f *rf;
  	struct irdma_cq_buf *cq_buf =3D NULL;
@@@ -2032,12 -2104,13 +2104,13 @@@
  	    IRDMA_FEATURE_CQ_RESIZE))
  		return -EOPNOTSUPP;
 =20
- 	if (udata && udata->inlen < IRDMA_RESIZE_CQ_MIN_REQ_LEN)
- 		return -EINVAL;
-=20
  	if (entries > rf->max_cqe)
  		return -EINVAL;
 =20
+ 	ret =3D ib_respond_empty_udata(udata);
+ 	if (ret)
+ 		return ret;
+=20
  	if (!iwcq->user_mode) {
  		entries +=3D 2;
 =20
@@@ -2064,9 -2137,9 +2137,9 @@@
  			rdma_udata_to_drv_context(udata, struct irdma_ucontext,
  						  ibucontext);
 =20
- 		if (ib_copy_from_udata(&req, udata,
- 				       min(sizeof(req), udata->inlen)))
- 			return -EINVAL;
+ 		ret =3D ib_copy_validate_udata_in(udata, req, user_cq_buffer);
+ 		if (ret)
+ 			return ret;
 =20
  		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
  		iwpbl_buf =3D irdma_get_pbl((unsigned long)req.user_cq_buffer,
@@@ -2128,6 -2201,19 +2201,19 @@@
  		goto error;
 =20
  	spin_lock_irqsave(&iwcq->lock, flags);
+ 	if (udata) {
+ 		struct irdma_pbl *old_iwpbl =3D iwcq->iwpbl;
+=20
+ 		/* Only update if the resize was successful. Otherwise, HW is
+ 		 * still pointing to the old PBL.
+ 		 */
+ 		iwcq->iwpbl =3D iwpbl_buf;
+ 		if (old_iwpbl) {
+ 			struct irdma_mr *old_iwmr =3D old_iwpbl->iwmr;
+=20
+ 			refcount_dec(&old_iwmr->user_ring_refs);
+ 		}
+ 	}
  	if (cq_buf) {
  		cq_buf->kmem_buf =3D iwcq->kmem;
  		cq_buf->hw =3D dev->hw;
@@@ -2143,6 -2229,11 +2229,11 @@@
 =20
  	return 0;
  error:
+ 	if (iwpbl_buf) {
+ 		struct irdma_mr *iwmr =3D iwpbl_buf->iwmr;
+=20
+ 		refcount_dec(&iwmr->user_ring_refs);
+ 	}
  	if (!udata) {
  		dma_free_coherent(dev->hw->device, kmem_buf.size, kmem_buf.va,
  				  kmem_buf.pa);
@@@ -2194,6 -2285,10 +2285,10 @@@ static int irdma_modify_srq(struct ib_s
  	struct cqp_cmds_info *cqp_info;
  	int status;
 =20
+ 	status =3D ib_no_udata_io(udata);
+ 	if (status)
+ 		return status;
+=20
  	if (attr_mask & IB_SRQ_MAX_WR)
  		return -EINVAL;
 =20
@@@ -2236,24 -2331,20 +2331,20 @@@ static int irdma_setup_umode_srq(struc
  				 struct irdma_srq_init_info *info,
  				 struct ib_udata *udata)
  {
- #define IRDMA_CREATE_SRQ_MIN_REQ_LEN \
- 	offsetofend(struct irdma_create_srq_req, user_shadow_area)
  	struct irdma_create_srq_req req =3D {};
  	struct irdma_ucontext *ucontext;
  	struct irdma_srq_mr *srqmr;
  	struct irdma_pbl *iwpbl;
  	unsigned long flags;
+ 	int ret;
 =20
  	iwsrq->user_mode =3D true;
  	ucontext =3D rdma_udata_to_drv_context(udata, struct irdma_ucontext,
  					     ibucontext);
 =20
- 	if (udata->inlen < IRDMA_CREATE_SRQ_MIN_REQ_LEN)
- 		return -EINVAL;
-=20
- 	if (ib_copy_from_udata(&req, udata,
- 			       min(sizeof(req), udata->inlen)))
- 		return -EFAULT;
+ 	ret =3D ib_copy_validate_udata_in(udata, req, user_shadow_area);
+ 	if (ret)
+ 		return ret;
 =20
  	spin_lock_irqsave(&ucontext->srq_reg_mem_list_lock, flags);
  	iwpbl =3D irdma_get_pbl((unsigned long)req.user_srq_buf,
@@@ -2316,6 -2407,7 +2407,7 @@@ static int irdma_create_srq(struct ib_s
  			    struct ib_srq_init_attr *initattrs,
  			    struct ib_udata *udata)
  {
+ #define IRDMA_CREATE_SRQ_MIN_RESP_LEN offsetofend(struct irdma_create_srq=
_resp, srq_size)
  	struct irdma_device *iwdev =3D to_iwdev(ibsrq->device);
  	struct ib_srq_attr *attr =3D &initattrs->attr;
  	struct irdma_pd *iwpd =3D to_iwpd(ibsrq->pd);
@@@ -2336,6 -2428,9 +2428,9 @@@
  	if (initattrs->srq_type !=3D IB_SRQT_BASIC)
  		return -EOPNOTSUPP;
 =20
+ 	if (udata && udata->outlen < IRDMA_CREATE_SRQ_MIN_RESP_LEN)
+ 		return -EINVAL;
+=20
  	if (!(uk_attrs->feature_flags & IRDMA_FEATURE_SRQ) ||
  	    attr->max_sge > uk_attrs->max_hw_wq_frags)
  		return -EINVAL;
@@@ -2419,6 -2514,11 +2514,11 @@@ free_dmem
  		dma_free_coherent(rf->hw.device, iwsrq->kmem.size,
  				  iwsrq->kmem.va, iwsrq->kmem.pa);
  free_rsrc:
+ 	if (iwsrq->user_mode && iwsrq->iwpbl) {
+ 		struct irdma_mr *iwmr =3D iwsrq->iwpbl->iwmr;
+=20
+ 		refcount_dec(&iwmr->user_ring_refs);
+ 	}
  	irdma_free_rsrc(rf, rf->allocated_srqs, iwsrq->srq_num);
  	return err_code;
  }
@@@ -2458,7 -2558,6 +2558,6 @@@ static int irdma_create_cq(struct ib_c
  			   const struct ib_cq_init_attr *attr,
  			   struct uverbs_attr_bundle *attrs)
  {
- #define IRDMA_CREATE_CQ_MIN_REQ_LEN offsetofend(struct irdma_create_cq_re=
q, user_cq_buf)
  #define IRDMA_CREATE_CQ_MIN_RESP_LEN offsetofend(struct irdma_create_cq_r=
esp, cq_size)
  	struct ib_udata *udata =3D &attrs->driver_udata;
  	struct ib_device *ibdev =3D ibcq->device;
@@@ -2482,8 -2581,7 +2581,7 @@@
  	if (err_code)
  		return err_code;
 =20
- 	if (udata && (udata->inlen < IRDMA_CREATE_CQ_MIN_REQ_LEN ||
- 		      udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN))
+ 	if (udata && udata->outlen < IRDMA_CREATE_CQ_MIN_RESP_LEN)
  		return -EINVAL;
 =20
  	err_code =3D irdma_alloc_rsrc(rf, rf->allocated_cqs, rf->max_cq, &cq_num,
@@@ -2498,6 -2596,8 +2596,8 @@@
  	INIT_LIST_HEAD(&iwcq->resize_list);
  	INIT_LIST_HEAD(&iwcq->cmpl_generated);
  	iwcq->cq_num =3D cq_num;
+ 	iwcq->iwpbl =3D NULL;
+ 	iwcq->iwpbl_shadow =3D NULL;
  	info.dev =3D dev;
  	ukinfo->cq_size =3D max(entries, 4);
  	ukinfo->cq_id =3D cq_num;
@@@ -2517,49 -2617,50 +2617,50 @@@
  		struct irdma_ucontext *ucontext;
  		struct irdma_create_cq_req req =3D {};
  		struct irdma_cq_mr *cqmr;
- 		struct irdma_pbl *iwpbl;
- 		struct irdma_pbl *iwpbl_shadow;
  		struct irdma_cq_mr *cqmr_shadow;
 =20
  		iwcq->user_mode =3D true;
  		ucontext =3D
  			rdma_udata_to_drv_context(udata, struct irdma_ucontext,
  						  ibucontext);
- 		if (ib_copy_from_udata(&req, udata,
- 				       min(sizeof(req), udata->inlen))) {
- 			err_code =3D -EFAULT;
+ 		/* Even though the last member of struct irdma_create_cq_req
+ 		 * was always user_shadow_area, we need backwards compat with
+ 		 * the legacy i40iw struct i40iw_ucreate_cq which stopped
+ 		 * at user_cq_buffer.
+ 		 */
+ 		err_code =3D ib_copy_validate_udata_in(udata, req, user_cq_buf);
+ 		if (err_code)
  			goto cq_free_rsrc;
- 		}
 =20
  		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
- 		iwpbl =3D irdma_get_pbl((unsigned long)req.user_cq_buf,
- 				      &ucontext->cq_reg_mem_list);
+ 		iwcq->iwpbl =3D irdma_get_pbl((unsigned long)req.user_cq_buf,
+ 					    &ucontext->cq_reg_mem_list);
  		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
- 		if (!iwpbl) {
+ 		if (!iwcq->iwpbl) {
  			err_code =3D -EPROTO;
  			goto cq_free_rsrc;
  		}
 =20
- 		cqmr =3D &iwpbl->cq_mr;
+ 		cqmr =3D &iwcq->iwpbl->cq_mr;
 =20
  		if (rf->sc_dev.hw_attrs.uk_attrs.feature_flags &
  		    IRDMA_FEATURE_CQ_RESIZE) {
  			spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
- 			iwpbl_shadow =3D irdma_get_pbl(
+ 			iwcq->iwpbl_shadow =3D irdma_get_pbl(
  					(unsigned long)req.user_shadow_area,
  					&ucontext->cq_reg_mem_list);
  			spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
 =20
- 			if (!iwpbl_shadow) {
+ 			if (!iwcq->iwpbl_shadow) {
  				err_code =3D -EPROTO;
  				goto cq_free_rsrc;
  			}
- 			cqmr_shadow =3D &iwpbl_shadow->cq_mr;
+ 			cqmr_shadow =3D &iwcq->iwpbl_shadow->cq_mr;
  			info.shadow_area_pa =3D cqmr_shadow->cq_pbl.addr;
  		} else {
  			info.shadow_area_pa =3D cqmr->shadow;
  		}
- 		if (iwpbl->pbl_allocated) {
+ 		if (iwcq->iwpbl->pbl_allocated) {
  			info.virtual_map =3D true;
  			info.pbl_chunk_size =3D 1;
  			info.first_pm_pbl_idx =3D cqmr->cq_pbl.idx;
@@@ -2801,7 -2902,7 +2902,7 @@@ static bool irdma_check_mem_contiguous(
  	u32 pg_idx;
 =20
  	for (pg_idx =3D 0; pg_idx < npages; pg_idx++) {
 -		if ((*arr + (pg_size * pg_idx)) !=3D arr[pg_idx])
 +		if ((*arr + ((u64)pg_size * pg_idx)) !=3D arr[pg_idx])
  			return false;
  	}
 =20
@@@ -2834,7 -2935,7 +2935,7 @@@ static bool irdma_check_mr_contiguous(s
 =20
  	for (i =3D 0; i < lvl2->leaf_cnt; i++, leaf++) {
  		arr =3D leaf->addr;
 -		if ((*start_addr + (i * pg_size * PBLE_PER_PAGE)) !=3D *arr)
 +		if ((*start_addr + ((u64)i * pg_size * PBLE_PER_PAGE)) !=3D *arr)
  			return false;
  		ret =3D irdma_check_mem_contiguous(arr, leaf->cnt, pg_size);
  		if (!ret)
@@@ -3034,6 -3135,10 +3135,10 @@@ static int irdma_alloc_mw(struct ib_mw=20
  	int err_code;
  	u32 stag;
 =20
+ 	err_code =3D ib_no_udata_io(udata);
+ 	if (err_code)
+ 		return err_code;
+=20
  	stag =3D irdma_create_stag(iwdev);
  	if (!stag)
  		return -ENOMEM;
@@@ -3362,6 -3467,7 +3467,7 @@@ static struct irdma_mr *irdma_alloc_iwm
  	if (!iwmr)
  		return ERR_PTR(-ENOMEM);
 =20
+ 	refcount_set(&iwmr->user_ring_refs, 1);
  	iwpbl =3D &iwmr->iwpbl;
  	iwpbl->iwmr =3D iwmr;
  	iwmr->region =3D region;
@@@ -3508,7 -3614,6 +3614,6 @@@ static struct ib_mr *irdma_reg_user_mr(
  				       struct ib_dmah *dmah,
  				       struct ib_udata *udata)
  {
- #define IRDMA_MEM_REG_MIN_REQ_LEN offsetofend(struct irdma_mem_reg_req, s=
q_pages)
  	struct irdma_device *iwdev =3D to_iwdev(pd->device);
  	struct irdma_mem_reg_req req =3D {};
  	struct ib_umem *region =3D NULL;
@@@ -3518,10 -3623,15 +3623,15 @@@
  	if (dmah)
  		return ERR_PTR(-EOPNOTSUPP);
 =20
- 	if (len > iwdev->rf->sc_dev.hw_attrs.max_mr_size)
- 		return ERR_PTR(-EINVAL);
+ 	err =3D ib_copy_validate_udata_in(udata, req, sq_pages);
+ 	if (err)
+ 		return ERR_PTR(err);
 =20
- 	if (udata->inlen < IRDMA_MEM_REG_MIN_REQ_LEN)
+ 	err =3D ib_respond_empty_udata(udata);
+ 	if (err)
+ 		return ERR_PTR(err);
+=20
+ 	if (len > iwdev->rf->sc_dev.hw_attrs.max_mr_size)
  		return ERR_PTR(-EINVAL);
 =20
  	region =3D ib_umem_get_va(pd->device, start, len, access);
@@@ -3532,11 -3642,6 +3642,6 @@@
  		return (struct ib_mr *)region;
  	}
 =20
- 	if (ib_copy_from_udata(&req, udata, min(sizeof(req), udata->inlen))) {
- 		ib_umem_release(region);
- 		return ERR_PTR(-EFAULT);
- 	}
-=20
  	iwmr =3D irdma_alloc_iwmr(region, pd, virt, req.reg_type);
  	if (IS_ERR(iwmr)) {
  		ib_umem_release(region);
@@@ -3784,15 -3889,16 +3889,19 @@@ static struct ib_mr *irdma_rereg_user_m
  	struct ib_umem_dmabuf *umem_dmabuf;
  	int ret;
 =20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ERR_PTR(ret);
+=20
  	if (len > iwdev->rf->sc_dev.hw_attrs.max_mr_size)
  		return ERR_PTR(-EINVAL);
 =20
  	if (flags & ~(IB_MR_REREG_TRANS | IB_MR_REREG_PD | IB_MR_REREG_ACCESS))
  		return ERR_PTR(-EOPNOTSUPP);
 =20
 +	if (iwmr->type !=3D IRDMA_MEMREG_TYPE_MEM)
 +	     return ERR_PTR(-EINVAL);
 +
  	ret =3D ib_umem_check_rereg(iwmr->region, flags, new_access);
  	if (ret)
  		return ERR_PTR(ret);
@@@ -3929,41 -4035,41 +4038,41 @@@ static struct ib_mr *irdma_get_dma_mr(s
   * irdma_del_memlist - Deleting pbl list entries for CQ/QP
   * @iwmr: iwmr for IB's user page addresses
   * @ucontext: ptr to user context
+  *
+  * Return: True if the MR is currently in-use by a QP/CQ/SRQ ring.
   */
- static void irdma_del_memlist(struct irdma_mr *iwmr,
+ static bool irdma_del_memlist(struct irdma_mr *iwmr,
  			      struct irdma_ucontext *ucontext)
  {
  	struct irdma_pbl *iwpbl =3D &iwmr->iwpbl;
  	unsigned long flags;
+ 	spinlock_t *lock;
+ 	bool in_use =3D false;
 =20
  	switch (iwmr->type) {
  	case IRDMA_MEMREG_TYPE_CQ:
- 		spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags);
- 		if (iwpbl->on_list) {
- 			iwpbl->on_list =3D false;
- 			list_del(&iwpbl->list);
- 		}
- 		spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, flags);
+ 		lock =3D &ucontext->cq_reg_mem_list_lock;
  		break;
  	case IRDMA_MEMREG_TYPE_QP:
- 		spin_lock_irqsave(&ucontext->qp_reg_mem_list_lock, flags);
- 		if (iwpbl->on_list) {
- 			iwpbl->on_list =3D false;
- 			list_del(&iwpbl->list);
- 		}
- 		spin_unlock_irqrestore(&ucontext->qp_reg_mem_list_lock, flags);
+ 		lock =3D &ucontext->qp_reg_mem_list_lock;
  		break;
  	case IRDMA_MEMREG_TYPE_SRQ:
- 		spin_lock_irqsave(&ucontext->srq_reg_mem_list_lock, flags);
- 		if (iwpbl->on_list) {
- 			iwpbl->on_list =3D false;
- 			list_del(&iwpbl->list);
- 		}
- 		spin_unlock_irqrestore(&ucontext->srq_reg_mem_list_lock, flags);
+ 		lock =3D &ucontext->srq_reg_mem_list_lock;
  		break;
  	default:
- 		break;
+ 		return false;
  	}
+=20
+ 	spin_lock_irqsave(lock, flags);
+ 	if (!refcount_dec_if_one(&iwmr->user_ring_refs)) {
+ 		in_use =3D true;
+ 	} else if (iwpbl->on_list) {
+ 		iwpbl->on_list =3D false;
+ 		list_del(&iwpbl->list);
+ 	}
+ 	spin_unlock_irqrestore(lock, flags);
+=20
+ 	return in_use;
  }
 =20
  /**
@@@ -3979,6 -4085,10 +4088,10 @@@ static int irdma_dereg_mr(struct ib_mr=20
  	bool dmabuf_revocable =3D iwmr->region && iwmr->region->is_dmabuf;
  	int ret;
 =20
+ 	ret =3D ib_no_udata_io(udata);
+ 	if (ret)
+ 		return ret;
+=20
  	if (iwmr->type !=3D IRDMA_MEMREG_TYPE_MEM) {
  		if (iwmr->region) {
  			struct irdma_ucontext *ucontext;
@@@ -3986,7 -4096,12 +4099,12 @@@
  			ucontext =3D rdma_udata_to_drv_context(udata,
  						struct irdma_ucontext,
  						ibucontext);
- 			irdma_del_memlist(iwmr, ucontext);
+=20
+ 			/* Do not allow the MR to be unpinned if it is still
+ 			 * backing a user ring.
+ 			 */
+ 			if (irdma_del_memlist(iwmr, ucontext))
+ 				return -EBUSY;
  		}
  		goto done;
  	}
@@@ -5295,6 -5410,10 +5413,10 @@@ static int irdma_create_user_ah(struct=20
  	struct irdma_ah *parent_ah;
  	int err;
 =20
+ 	err =3D ib_is_udata_in_empty(udata);
+ 	if (err)
+ 		return err;
+=20
  	if (udata->outlen < IRDMA_CREATE_AH_MIN_RESP_LEN)
  		return -EINVAL;
 =20
@@@ -5346,6 -5465,10 +5468,10 @@@ static int irdma_create_ah(struct ib_a
  	struct irdma_device *iwdev =3D to_iwdev(ibah->pd->device);
  	int err;
 =20
+ 	err =3D ib_no_udata_io(udata);
+ 	if (err)
+ 		return err;
+=20
  	err =3D irdma_setup_ah(ibah, attr);
  	if (err)
  		return err;
@@@ -5428,6 -5551,7 +5554,7 @@@ static const struct ib_device_ops irdma
  	.owner =3D THIS_MODULE,
  	.driver_id =3D RDMA_DRIVER_IRDMA,
  	.uverbs_abi_ver =3D IRDMA_ABI_VER,
+ 	.uverbs_robust_udata =3D true,
 =20
  	.alloc_hw_port_stats =3D irdma_alloc_hw_port_stats,
  	.alloc_mr =3D irdma_alloc_mr,

--7TKuuBEeLHIP6Or3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeNCgACgkQJNaLcl1U
h9BYigf7Bt5tw6F7F6QmfFMxK4EqZUm2nXqh7WdC8nwnXTWYqRRwVy21FzuiAcWe
33ks9wZnW7KAFFC8JqyAajpkEX0etRuDUdGCSNsCyKJrLFOappn+M9lzXsIXMNVI
unDLphaofdtqlSA+nOKIPFmle60jRnh68H5wuev2LyB/SUFYngziP0kTNzxNY6On
pE1zxmoqK+tYEO5b13JUXj6J/AQBym9OZUEUT+QPyS1InqfCqqeuLuP0ackTfAIa
dBH3BZ86ZBG4uJVLJpP6RB8coNQJJHnm6oAhjSwTkG1Fm9/1EIqMxRU81k/jLFeP
95H1hP9dnlsQ6v1vDcV6Yat2s4kK6A==
=CFYP
-----END PGP SIGNATURE-----

--7TKuuBEeLHIP6Or3--
