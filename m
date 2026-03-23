Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB563AF670;
	Mon, 23 Mar 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276956; cv=none; b=QLcFrDWHbbaREKm9Yxo9bzi+B8bobOEKBSU5yBvieloKnZGuVDIYxCyLhMpht2OpMZD49PKwr/M8Ui7n5Iuq24vpF/yhHY01SQZXhcF8Oul15OkYR3Uy+74xInY4No1Q2Vt409GJN0u/0XW92kygHubt0XsZB7Y9knO4N9rlxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276956; c=relaxed/simple;
	bh=plRb9R6Itt6xuZS7kwnCeselHvKSPb1JINbcAmmaUP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evZlxBPUCCLVf4zJVVp+5iNq7Sl3qSBXnGuVDsSIwR4ZxUiwQfGzzmzRQnR26veoAbGUqvALeYdT/WCZrOUdysGQMDRSkwIP6ie8vzsiAYZiSl6YsXvY/2WUlY0XD0jeVfHighPi9nci4oaH93+V4/hKq4Ea6p7LJ0fIoUndbEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eS53WaK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eS53WaK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20CBC4CEF7;
	Mon, 23 Mar 2026 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276956;
	bh=plRb9R6Itt6xuZS7kwnCeselHvKSPb1JINbcAmmaUP0=;
	h=Date:From:To:Cc:Subject:From;
	b=eS53WaK5v3sYsIJs6ccQ07PO6RNa2aZft5ti0fFxYt61NmwzM/RkoognXTN03PFer
	 wTc20qjpy9BHT1Um/zBcXHeBseVRC2gAbqi1yGMKcqjcwsf4goZ2zZLLkKqGI1w/51
	 JEX8RSQUoMltj22gTMCLNfzGpH5e3N74SK6SHrO2Jxbr4qna4LekyUtw1zkQ2pWfJ9
	 5v4PEPwpU8DAhrRlpe5lti1fihLk0PUcZG9tjWdqtAcfNTjOseTVPGRfVUAo1YS2zM
	 mcLzrY6hR8d3FP8q0Tw7tt5sveCoGNvL5azpcUI0ro4taym+GWQUZyiFMZqe6dae9E
	 BnS0iegszmMqA==
Date: Mon, 23 Mar 2026 14:42:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the reset tree with the reset-fixes tree
Message-ID: <acFRVzvV9Dww47v_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pnTA1K8BTMGG8t8X"
Content-Disposition: inline


--pnTA1K8BTMGG8t8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the reset tree got a conflict in:

  drivers/reset/core.c

between commit:

  fbffb8c7c7bb4 ("reset: gpio: fix double free in reset_add_gpio_aux_device=
() error path")

=66rom the reset-fixes tree and commit:

  6703784ab9a80 ("reset: fold ida_alloc() into reset_create_gpio_aux_device=
()")

=66rom the reset tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/reset/core.c
index 352c2360603bc,a0d8c68f2afc2..0000000000000
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@@ -12,6 -12,7 +12,7 @@@
  #include <linux/device.h>
  #include <linux/err.h>
  #include <linux/export.h>
+ #include <linux/fwnode.h>
  #include <linux/gpio/driver.h>
  #include <linux/gpio/machine.h>
  #include <linux/gpio/property.h>
@@@ -20,9 -21,11 +21,11 @@@
  #include <linux/kref.h>
  #include <linux/module.h>
  #include <linux/of.h>
+ #include <linux/property.h>
  #include <linux/reset.h>
  #include <linux/reset-controller.h>
  #include <linux/slab.h>
+ #include <linux/srcu.h>
 =20
  static DEFINE_MUTEX(reset_list_mutex);
  static LIST_HEAD(reset_controller_list);
@@@ -36,6 -39,7 +39,7 @@@ static DEFINE_IDA(reset_gpio_ida)
   * struct reset_control - a reset control
   * @rcdev: a pointer to the reset controller device
   *         this reset control belongs to
+  * @srcu: protects the rcdev pointer from removal during consumer access
   * @list: list entry for the rcdev's reset controller list
   * @id: ID of the reset controller in the reset
   *      controller device
@@@ -47,9 -51,11 +51,11 @@@
   * @triggered_count: Number of times this reset line has been reset. Curr=
ently
   *                   only used for shared resets, which means that the va=
lue
   *                   will be either 0 or 1.
+  * @lock: serializes the internals of reset_control_acquire()
   */
  struct reset_control {
- 	struct reset_controller_dev *rcdev;
+ 	struct reset_controller_dev __rcu *rcdev;
+ 	struct srcu_struct srcu;
  	struct list_head list;
  	unsigned int id;
  	struct kref refcnt;
@@@ -58,6 -64,7 +64,7 @@@
  	bool array;
  	atomic_t deassert_count;
  	atomic_t triggered_count;
+ 	struct mutex lock;
  };
 =20
  /**
@@@ -74,14 -81,16 +81,16 @@@ struct reset_control_array=20
 =20
  /**
   * struct reset_gpio_lookup - lookup key for ad-hoc created reset-gpio de=
vices
-  * @of_args: phandle to the reset controller with all the args like GPIO =
number
+  * @ref_args: Reference to the reset controller with all the args like GP=
IO number
   * @swnode: Software node containing the reference to the GPIO provider
   * @list: list entry for the reset_gpio_lookup_list
+  * @adev: Auxiliary device representing the reset controller
   */
  struct reset_gpio_lookup {
- 	struct of_phandle_args of_args;
+ 	struct fwnode_reference_args ref_args;
  	struct fwnode_handle *swnode;
  	struct list_head list;
+ 	struct auxiliary_device adev;
  };
 =20
  static const char *rcdev_name(struct reset_controller_dev *rcdev)
@@@ -89,27 -98,24 +98,24 @@@
  	if (rcdev->dev)
  		return dev_name(rcdev->dev);
 =20
- 	if (rcdev->of_node)
- 		return rcdev->of_node->full_name;
-=20
- 	if (rcdev->of_args)
- 		return rcdev->of_args->np->full_name;
+ 	if (rcdev->fwnode)
+ 		return fwnode_get_name(rcdev->fwnode);
 =20
  	return NULL;
  }
 =20
  /**
-  * of_reset_simple_xlate - translate reset_spec to the reset line number
+  * fwnode_reset_simple_xlate - translate reset_spec to the reset line num=
ber
   * @rcdev: a pointer to the reset controller device
-  * @reset_spec: reset line specifier as found in the device tree
+  * @reset_spec: reset line specifier as found in firmware
   *
-  * This static translation function is used by default if of_xlate in
-  * :c:type:`reset_controller_dev` is not set. It is useful for all reset
-  * controllers with 1:1 mapping, where reset lines can be indexed by numb=
er
-  * without gaps.
+  * This static translation function is used by default if neither fwnode_=
xlate
+  * not of_xlate in :c:type:`reset_controller_dev` is not set. It is usefu=
l for
+  * all reset controllers with 1:1 mapping, where reset lines can be index=
ed by
+  * number without gaps.
   */
- static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
- 				 const struct of_phandle_args *reset_spec)
+ static int fwnode_reset_simple_xlate(struct reset_controller_dev *rcdev,
+ 				     const struct fwnode_reference_args *reset_spec)
  {
  	if (reset_spec->args[0] >=3D rcdev->nr_resets)
  		return -EINVAL;
@@@ -123,33 -129,71 +129,71 @@@
   */
  int reset_controller_register(struct reset_controller_dev *rcdev)
  {
- 	if (rcdev->of_node && rcdev->of_args)
+ 	if ((rcdev->of_node && rcdev->fwnode) || (rcdev->of_xlate && rcdev->fwno=
de_xlate))
  		return -EINVAL;
 =20
- 	if (!rcdev->of_xlate) {
- 		rcdev->of_reset_n_cells =3D 1;
- 		rcdev->of_xlate =3D of_reset_simple_xlate;
+ 	if (rcdev->of_node && !rcdev->fwnode)
+ 		rcdev->fwnode =3D of_fwnode_handle(rcdev->of_node);
+=20
+ 	if (!rcdev->fwnode) {
+ 		rcdev->fwnode =3D dev_fwnode(rcdev->dev);
+ 		if (!rcdev->fwnode)
+ 			return -EINVAL;
+ 	}
+=20
+ 	if (rcdev->of_xlate)
+ 		rcdev->fwnode_reset_n_cells =3D rcdev->of_reset_n_cells;
+=20
+ 	if (!rcdev->fwnode_xlate && !rcdev->of_xlate) {
+ 		rcdev->fwnode_xlate =3D fwnode_reset_simple_xlate;
+ 		rcdev->fwnode_reset_n_cells =3D 1;
  	}
 =20
  	INIT_LIST_HEAD(&rcdev->reset_control_head);
+ 	mutex_init(&rcdev->lock);
+=20
+ 	guard(mutex)(&reset_list_mutex);
 =20
- 	mutex_lock(&reset_list_mutex);
  	list_add(&rcdev->list, &reset_controller_list);
- 	mutex_unlock(&reset_list_mutex);
 =20
  	return 0;
  }
  EXPORT_SYMBOL_GPL(reset_controller_register);
 =20
+ static void reset_controller_remove(struct reset_controller_dev *rcdev,
+ 				    struct reset_control *rstc)
+ {
+ 	lockdep_assert_held(&rcdev->lock);
+=20
+ 	list_del(&rstc->list);
+ 	module_put(rcdev->owner);
+ 	put_device(rcdev->dev);
+ }
+=20
  /**
   * reset_controller_unregister - unregister a reset controller device
   * @rcdev: a pointer to the reset controller device
   */
  void reset_controller_unregister(struct reset_controller_dev *rcdev)
  {
- 	mutex_lock(&reset_list_mutex);
- 	list_del(&rcdev->list);
- 	mutex_unlock(&reset_list_mutex);
+ 	struct reset_control *rstc, *pos;
+=20
+ 	scoped_guard(mutex, &reset_list_mutex)
+ 		list_del(&rcdev->list);
+=20
+ 	scoped_guard(mutex, &rcdev->lock) {
+ 		/*
+ 		 * Numb but don't free the remaining reset control handles that are
+ 		 * still held by consumers.
+ 		 */
+ 		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
+ 			rcu_assign_pointer(rstc->rcdev, NULL);
+ 			synchronize_srcu(&rstc->srcu);
+ 			reset_controller_remove(rcdev, rstc);
+ 		}
+ 	}
+=20
+ 	mutex_destroy(&rcdev->lock);
  }
  EXPORT_SYMBOL_GPL(reset_controller_unregister);
 =20
@@@ -326,6 -370,7 +370,7 @@@ static inline bool reset_control_is_arr
   */
  int reset_control_reset(struct reset_control *rstc)
  {
+ 	struct reset_controller_dev *rcdev;
  	int ret;
 =20
  	if (!rstc)
@@@ -337,7 -382,13 +382,13 @@@
  	if (reset_control_is_array(rstc))
  		return reset_control_array_reset(rstc_to_array(rstc));
 =20
- 	if (!rstc->rcdev->ops->reset)
+ 	guard(srcu)(&rstc->srcu);
+=20
+ 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 	if (!rcdev)
+ 		return -ENODEV;
+=20
+ 	if (!rcdev->ops->reset)
  		return -ENOTSUPP;
 =20
  	if (rstc->shared) {
@@@ -351,7 -402,7 +402,7 @@@
  			return -EPERM;
  	}
 =20
- 	ret =3D rstc->rcdev->ops->reset(rstc->rcdev, rstc->id);
+ 	ret =3D rcdev->ops->reset(rcdev, rstc->id);
  	if (rstc->shared && ret)
  		atomic_dec(&rstc->triggered_count);
 =20
@@@ -441,6 -492,8 +492,8 @@@ EXPORT_SYMBOL_GPL(reset_control_rearm)
   */
  int reset_control_assert(struct reset_control *rstc)
  {
+ 	struct reset_controller_dev *rcdev;
+=20
  	if (!rstc)
  		return 0;
 =20
@@@ -450,6 -503,12 +503,12 @@@
  	if (reset_control_is_array(rstc))
  		return reset_control_array_assert(rstc_to_array(rstc));
 =20
+ 	guard(srcu)(&rstc->srcu);
+=20
+ 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 	if (!rcdev)
+ 		return -ENODEV;
+=20
  	if (rstc->shared) {
  		if (WARN_ON(atomic_read(&rstc->triggered_count) !=3D 0))
  			return -EINVAL;
@@@ -464,7 -523,7 +523,7 @@@
  		 * Shared reset controls allow the reset line to be in any state
  		 * after this call, so doing nothing is a valid option.
  		 */
- 		if (!rstc->rcdev->ops->assert)
+ 		if (!rcdev->ops->assert)
  			return 0;
  	} else {
  		/*
@@@ -472,17 -531,17 +531,17 @@@
  		 * is no way to guarantee that the reset line is asserted after
  		 * this call.
  		 */
- 		if (!rstc->rcdev->ops->assert)
+ 		if (!rcdev->ops->assert)
  			return -ENOTSUPP;
 =20
  		if (!rstc->acquired) {
  			WARN(1, "reset %s (ID: %u) is not acquired\n",
- 			     rcdev_name(rstc->rcdev), rstc->id);
+ 			     rcdev_name(rcdev), rstc->id);
  			return -EPERM;
  		}
  	}
 =20
- 	return rstc->rcdev->ops->assert(rstc->rcdev, rstc->id);
+ 	return rcdev->ops->assert(rcdev, rstc->id);
  }
  EXPORT_SYMBOL_GPL(reset_control_assert);
 =20
@@@ -529,6 -588,8 +588,8 @@@ EXPORT_SYMBOL_GPL(reset_control_bulk_as
   */
  int reset_control_deassert(struct reset_control *rstc)
  {
+ 	struct reset_controller_dev *rcdev;
+=20
  	if (!rstc)
  		return 0;
 =20
@@@ -538,6 -599,12 +599,12 @@@
  	if (reset_control_is_array(rstc))
  		return reset_control_array_deassert(rstc_to_array(rstc));
 =20
+ 	guard(srcu)(&rstc->srcu);
+=20
+ 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 	if (!rcdev)
+ 		return -ENODEV;
+=20
  	if (rstc->shared) {
  		if (WARN_ON(atomic_read(&rstc->triggered_count) !=3D 0))
  			return -EINVAL;
@@@ -547,7 -614,7 +614,7 @@@
  	} else {
  		if (!rstc->acquired) {
  			WARN(1, "reset %s (ID: %u) is not acquired\n",
- 			     rcdev_name(rstc->rcdev), rstc->id);
+ 			     rcdev_name(rcdev), rstc->id);
  			return -EPERM;
  		}
  	}
@@@ -559,10 -626,10 +626,10 @@@
  	 * case, the reset controller driver should implement .deassert() and
  	 * return -ENOTSUPP.
  	 */
- 	if (!rstc->rcdev->ops->deassert)
+ 	if (!rcdev->ops->deassert)
  		return 0;
 =20
- 	return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->id);
+ 	return rcdev->ops->deassert(rcdev, rstc->id);
  }
  EXPORT_SYMBOL_GPL(reset_control_deassert);
 =20
@@@ -604,14 -671,22 +671,22 @@@ EXPORT_SYMBOL_GPL(reset_control_bulk_de
   */
  int reset_control_status(struct reset_control *rstc)
  {
+ 	struct reset_controller_dev *rcdev;
+=20
  	if (!rstc)
  		return 0;
 =20
  	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
  		return -EINVAL;
 =20
- 	if (rstc->rcdev->ops->status)
- 		return rstc->rcdev->ops->status(rstc->rcdev, rstc->id);
+ 	guard(srcu)(&rstc->srcu);
+=20
+ 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 	if (!rcdev)
+ 		return -ENODEV;
+=20
+ 	if (rcdev->ops->status)
+ 		return rcdev->ops->status(rcdev, rstc->id);
 =20
  	return -ENOTSUPP;
  }
@@@ -639,6 -714,7 +714,7 @@@ EXPORT_SYMBOL_GPL(reset_control_status)
   */
  int reset_control_acquire(struct reset_control *rstc)
  {
+ 	struct reset_controller_dev *rcdev;
  	struct reset_control *rc;
 =20
  	if (!rstc)
@@@ -650,25 -726,28 +726,28 @@@
  	if (reset_control_is_array(rstc))
  		return reset_control_array_acquire(rstc_to_array(rstc));
 =20
- 	mutex_lock(&reset_list_mutex);
+ 	guard(mutex)(&rstc->lock);
 =20
- 	if (rstc->acquired) {
- 		mutex_unlock(&reset_list_mutex);
+ 	if (rstc->acquired)
  		return 0;
- 	}
 =20
- 	list_for_each_entry(rc, &rstc->rcdev->reset_control_head, list) {
- 		if (rstc !=3D rc && rstc->id =3D=3D rc->id) {
- 			if (rc->acquired) {
- 				mutex_unlock(&reset_list_mutex);
- 				return -EBUSY;
+ 	guard(srcu)(&rstc->srcu);
+=20
+ 	rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 	if (!rcdev)
+ 		return -ENODEV;
+=20
+ 	scoped_guard(mutex, &rcdev->lock) {
+ 		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
+ 			if (rstc !=3D rc && rstc->id =3D=3D rc->id) {
+ 				if (rc->acquired)
+ 					return -EBUSY;
  			}
  		}
  	}
 =20
  	rstc->acquired =3D true;
 =20
- 	mutex_unlock(&reset_list_mutex);
  	return 0;
  }
  EXPORT_SYMBOL_GPL(reset_control_acquire);
@@@ -752,8 -831,9 +831,9 @@@ __reset_control_get_internal(struct res
  	bool shared =3D flags & RESET_CONTROL_FLAGS_BIT_SHARED;
  	bool acquired =3D flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
  	struct reset_control *rstc;
+ 	int ret;
 =20
- 	lockdep_assert_held(&reset_list_mutex);
+ 	lockdep_assert_held(&rcdev->lock);
 =20
  	/* Expect callers to filter out OPTIONAL and DEASSERTED bits */
  	if (WARN_ON(flags & ~(RESET_CONTROL_FLAGS_BIT_SHARED |
@@@ -782,15 -862,23 +862,23 @@@
  	if (!rstc)
  		return ERR_PTR(-ENOMEM);
 =20
+ 	ret =3D init_srcu_struct(&rstc->srcu);
+ 	if (ret) {
+ 		kfree(rstc);
+ 		return ERR_PTR(ret);
+ 	}
+=20
  	if (!try_module_get(rcdev->owner)) {
+ 		cleanup_srcu_struct(&rstc->srcu);
  		kfree(rstc);
  		return ERR_PTR(-ENODEV);
  	}
 =20
- 	rstc->rcdev =3D rcdev;
+ 	rcu_assign_pointer(rstc->rcdev, rcdev);
  	list_add(&rstc->list, &rcdev->reset_control_head);
  	rstc->id =3D index;
  	kref_init(&rstc->refcnt);
+ 	mutex_init(&rstc->lock);
  	rstc->acquired =3D acquired;
  	rstc->shared =3D shared;
  	get_device(rcdev->dev);
@@@ -802,76 -890,133 +890,133 @@@ static void __reset_control_release(str
  {
  	struct reset_control *rstc =3D container_of(kref, struct reset_control,
  						  refcnt);
+ 	struct reset_controller_dev *rcdev;
 =20
- 	lockdep_assert_held(&reset_list_mutex);
+ 	lockdep_assert_held(&rstc->srcu);
 =20
- 	module_put(rstc->rcdev->owner);
+ 	rcdev =3D rcu_replace_pointer(rstc->rcdev, NULL, true);
+ 	if (rcdev) {
+ 		lockdep_assert_held(&rcdev->lock);
+ 		reset_controller_remove(rcdev, rstc);
+ 	}
 =20
- 	list_del(&rstc->list);
- 	put_device(rstc->rcdev->dev);
- 	kfree(rstc);
+ 	mutex_destroy(&rstc->lock);
  }
 =20
- static void __reset_control_put_internal(struct reset_control *rstc)
+ static void reset_control_put_internal(struct reset_control *rstc)
  {
- 	lockdep_assert_held(&reset_list_mutex);
+ 	struct reset_controller_dev *rcdev;
+ 	int ret =3D 0;
 =20
  	if (IS_ERR_OR_NULL(rstc))
  		return;
 =20
- 	kref_put(&rstc->refcnt, __reset_control_release);
+ 	scoped_guard(srcu, &rstc->srcu) {
+ 		rcdev =3D srcu_dereference(rstc->rcdev, &rstc->srcu);
+ 		if (!rcdev)
+ 			/* Already released. */
+ 			return;
+=20
+ 		guard(mutex)(&rcdev->lock);
+ 		ret =3D kref_put(&rstc->refcnt, __reset_control_release);
+ 	}
+=20
+ 	if (ret) {
+ 		synchronize_srcu(&rstc->srcu);
+ 		cleanup_srcu_struct(&rstc->srcu);
+ 		kfree(rstc);
+ 	}
  }
 =20
  static void reset_gpio_aux_device_release(struct device *dev)
  {
- 	struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
-=20
- 	kfree(adev);
+ 	WARN(1, "reset-gpio device %s should never have been removed", dev_name(=
dev));
  }
 =20
- static int reset_add_gpio_aux_device(struct device *parent,
- 				     struct fwnode_handle *swnode,
- 				     int id, void *pdata)
+ static int reset_create_gpio_aux_device(struct reset_gpio_lookup *rgpio_d=
ev,
+ 					struct device *parent)
  {
- 	struct auxiliary_device *adev;
- 	int ret;
+ 	struct auxiliary_device *adev =3D &rgpio_dev->adev;
+ 	int ret, id;
 =20
- 	adev =3D kzalloc_obj(*adev);
- 	if (!adev)
+ 	id =3D ida_alloc(&reset_gpio_ida, GFP_KERNEL);
+ 	if (id < 0)
  		return -ENOMEM;
 =20
  	adev->id =3D id;
  	adev->name =3D "gpio";
  	adev->dev.parent =3D parent;
- 	adev->dev.platform_data =3D pdata;
+ 	adev->dev.platform_data =3D &rgpio_dev->ref_args;
  	adev->dev.release =3D reset_gpio_aux_device_release;
- 	device_set_node(&adev->dev, swnode);
+ 	device_set_node(&adev->dev, rgpio_dev->swnode);
 =20
  	ret =3D auxiliary_device_init(adev);
  	if (ret) {
- 		kfree(adev);
+ 		ida_free(&reset_gpio_ida, id);
  		return ret;
  	}
 =20
  	ret =3D __auxiliary_device_add(adev, "reset");
  	if (ret) {
  		auxiliary_device_uninit(adev);
+ 		ida_free(&reset_gpio_ida, id);
  		return ret;
  	}
 =20
- 	return ret;
+ 	return 0;
+ }
+=20
+ static void reset_gpio_add_devlink(struct fwnode_handle *fwnode,
+ 				   struct reset_gpio_lookup *rgpio_dev)
+ {
+ 	struct device *consumer;
+=20
+ 	/*
+ 	 * We must use get_dev_from_fwnode() and not ref_find_device_by_node()
+ 	 * because the latter only considers the platform bus while we want to
+ 	 * get consumers of any kind that can be associated with firmware
+ 	 * nodes: auxiliary, soundwire, etc.
+ 	 */
+ 	consumer =3D get_dev_from_fwnode(fwnode);
+ 	if (consumer) {
+ 		if (!device_link_add(consumer, &rgpio_dev->adev.dev,
+ 				     DL_FLAG_AUTOREMOVE_CONSUMER))
+ 			pr_warn("Failed to create a device link between reset-gpio and its con=
sumer");
+=20
+ 		put_device(consumer);
+ 	}
+ 	/*
+ 	 * else { }
+ 	 *
+ 	 * TODO: If ever there's a case where we need to support shared
+ 	 * reset-gpios retrieved from a device node for which there's no
+ 	 * device present yet, this is where we'd set up a notifier waiting
+ 	 * for the device to appear in the system. This would be a lot of code
+ 	 * that would go unused for now so let's cross that bridge when and if
+ 	 * we get there.
+ 	 */
+ }
+=20
+ /* TODO: move it out into drivers/base/ */
+ static bool fwnode_reference_args_equal(const struct fwnode_reference_arg=
s *left,
+ 					const struct fwnode_reference_args *right)
+ {
+ 	return left->fwnode =3D=3D right->fwnode && left->nargs =3D=3D right->na=
rgs &&
+ 	       !memcmp(left->args, right->args, sizeof(left->args[0]) * left->na=
rgs);
  }
 =20
  /*
-  * @args:	phandle to the GPIO provider with all the args like GPIO number
+  * @np: OF-node associated with the consumer
+  * @args: Reference to the GPIO provider with all the args like GPIO numb=
er
   */
- static int __reset_add_reset_gpio_device(const struct of_phandle_args *ar=
gs)
+ static int __reset_add_reset_gpio_device(struct fwnode_handle *fwnode,
+ 					 const struct fwnode_reference_args *args)
  {
  	struct property_entry properties[3] =3D { };
- 	unsigned int offset, of_flags, lflags;
+ 	unsigned int offset, flags, lflags;
  	struct reset_gpio_lookup *rgpio_dev;
  	struct device *parent;
- 	int id, ret, prop =3D 0;
+ 	int ret, prop =3D 0;
 =20
  	/*
  	 * Currently only #gpio-cells=3D2 is supported with the meaning of:
@@@ -879,7 -1024,7 +1024,7 @@@
  	 * args[1]: GPIO flags
  	 * TODO: Handle other cases.
  	 */
- 	if (args->args_count !=3D 2)
+ 	if (args->nargs !=3D 2)
  		return -ENOENT;
 =20
  	/*
@@@ -890,7 -1035,7 +1035,7 @@@
  	lockdep_assert_not_held(&reset_list_mutex);
 =20
  	offset =3D args->args[0];
- 	of_flags =3D args->args[1];
+ 	flags =3D args->args[1];
 =20
  	/*
  	 * Later we map GPIO flags between OF and Linux, however not all
@@@ -900,90 -1045,89 +1045,89 @@@
  	 * FIXME: Find a better way of translating OF flags to GPIO lookup
  	 * flags.
  	 */
- 	if (of_flags > GPIO_ACTIVE_LOW) {
+ 	if (flags > GPIO_ACTIVE_LOW) {
  		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
- 		       of_flags, offset);
+ 		       flags, offset);
  		return -EINVAL;
  	}
 =20
  	struct gpio_device *gdev __free(gpio_device_put) =3D
- 		gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
+ 			gpio_device_find_by_fwnode(args->fwnode);
  	if (!gdev)
  		return -EPROBE_DEFER;
 =20
  	guard(mutex)(&reset_gpio_lookup_mutex);
 =20
  	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
- 		if (args->np =3D=3D rgpio_dev->of_args.np) {
- 			if (of_phandle_args_equal(args, &rgpio_dev->of_args))
- 				return 0; /* Already on the list, done */
+ 		if (fwnode_reference_args_equal(args, &rgpio_dev->ref_args)) {
+ 			/*
+ 			 * Already on the list, create the device link
+ 			 * and stop here.
+ 			 */
+ 			reset_gpio_add_devlink(fwnode, rgpio_dev);
+ 			return 0;
  		}
  	}
 =20
- 	lflags =3D GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
+ 	lflags =3D GPIO_PERSISTENT | (flags & GPIO_ACTIVE_LOW);
  	parent =3D gpio_device_to_device(gdev);
  	properties[prop++] =3D PROPERTY_ENTRY_STRING("compatible", "reset-gpio");
  	properties[prop++] =3D PROPERTY_ENTRY_GPIO("reset-gpios", parent->fwnode=
, offset, lflags);
 =20
- 	id =3D ida_alloc(&reset_gpio_ida, GFP_KERNEL);
- 	if (id < 0)
- 		return id;
-=20
  	/* Not freed on success, because it is persisent subsystem data. */
  	rgpio_dev =3D kzalloc_obj(*rgpio_dev);
- 	if (!rgpio_dev) {
- 		ret =3D -ENOMEM;
- 		goto err_ida_free;
- 	}
+ 	if (!rgpio_dev)
+ 		return -ENOMEM;
 =20
- 	rgpio_dev->of_args =3D *args;
+ 	rgpio_dev->ref_args =3D *args;
  	/*
- 	 * We keep the device_node reference, but of_args.np is put at the end
- 	 * of __of_reset_control_get(), so get it one more time.
+ 	 * We keep the fwnode_handle reference, but ref_args.fwnode is put at
+ 	 * the end of __fwnode_reset_control_get(), so get it one more time.
  	 * Hold reference as long as rgpio_dev memory is valid.
  	 */
- 	of_node_get(rgpio_dev->of_args.np);
+ 	fwnode_handle_get(rgpio_dev->ref_args.fwnode);
 =20
  	rgpio_dev->swnode =3D fwnode_create_software_node(properties, NULL);
  	if (IS_ERR(rgpio_dev->swnode)) {
  		ret =3D PTR_ERR(rgpio_dev->swnode);
- 		goto err_put_of_node;
+ 		goto err_put_fwnode;
  	}
 =20
- 	ret =3D reset_add_gpio_aux_device(parent, rgpio_dev->swnode, id,
- 					&rgpio_dev->of_args);
+ 	ret =3D reset_create_gpio_aux_device(rgpio_dev, parent);
  	if (ret)
  		goto err_del_swnode;
 =20
+ 	reset_gpio_add_devlink(fwnode, rgpio_dev);
  	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
 =20
  	return 0;
 =20
  err_del_swnode:
  	fwnode_remove_software_node(rgpio_dev->swnode);
- err_put_of_node:
- 	of_node_put(rgpio_dev->of_args.np);
+ err_put_fwnode:
+ 	fwnode_handle_put(rgpio_dev->ref_args.fwnode);
  	kfree(rgpio_dev);
- err_ida_free:
- 	ida_free(&reset_gpio_ida, id);
 =20
  	return ret;
  }
 =20
- static struct reset_controller_dev *__reset_find_rcdev(const struct of_ph=
andle_args *args,
- 						       bool gpio_fallback)
+ static struct reset_controller_dev *
+ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fa=
llback)
  {
+ 	struct fwnode_reference_args *rc_args;
  	struct reset_controller_dev *rcdev;
 =20
  	lockdep_assert_held(&reset_list_mutex);
 =20
  	list_for_each_entry(rcdev, &reset_controller_list, list) {
- 		if (gpio_fallback) {
- 			if (rcdev->of_args && of_phandle_args_equal(args,
- 								    rcdev->of_args))
+ 		if (gpio_fallback && rcdev->dev &&
+ 		    device_is_compatible(rcdev->dev, "reset-gpio")) {
+ 			rc_args =3D dev_get_platdata(rcdev->dev);
+=20
+ 			if (fwnode_reference_args_equal(args, rc_args))
  				return rcdev;
  		} else {
- 			if (args->np =3D=3D rcdev->of_node)
+ 			if (args->fwnode =3D=3D rcdev->fwnode)
  				return rcdev;
  		}
  	}
@@@ -992,31 -1136,31 +1136,31 @@@
  }
 =20
  struct reset_control *
- __of_reset_control_get(struct device_node *node, const char *id, int inde=
x,
- 		       enum reset_control_flags flags)
+ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, =
int index,
+ 			   enum reset_control_flags flags)
  {
  	bool optional =3D flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
  	bool gpio_fallback =3D false;
- 	struct reset_control *rstc;
+ 	struct reset_control *rstc =3D ERR_PTR(-EINVAL);
  	struct reset_controller_dev *rcdev;
- 	struct of_phandle_args args;
- 	int rstc_id;
+ 	struct fwnode_reference_args args;
+ 	struct of_phandle_args of_args;
+ 	int rstc_id =3D -EINVAL;
  	int ret;
 =20
- 	if (!node)
+ 	if (!fwnode)
  		return ERR_PTR(-EINVAL);
 =20
  	if (id) {
- 		index =3D of_property_match_string(node,
- 						 "reset-names", id);
+ 		index =3D fwnode_property_match_string(fwnode, "reset-names", id);
  		if (index =3D=3D -EILSEQ)
  			return ERR_PTR(index);
  		if (index < 0)
  			return optional ? NULL : ERR_PTR(-ENOENT);
  	}
 =20
- 	ret =3D of_parse_phandle_with_args(node, "resets", "#reset-cells",
- 					 index, &args);
+ 	ret =3D fwnode_property_get_reference_args(fwnode, "resets", "#reset-cel=
ls",
+ 						 0, index, &args);
  	if (ret =3D=3D -EINVAL)
  		return ERR_PTR(ret);
  	if (ret) {
@@@ -1027,51 -1171,65 +1171,65 @@@
  		 * There can be only one reset-gpio for regular devices, so
  		 * don't bother with the "reset-gpios" phandle index.
  		 */
- 		ret =3D of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
- 						 0, &args);
+ 		ret =3D fwnode_property_get_reference_args(fwnode, "reset-gpios",
+ 							 "#gpio-cells", 0, 0, &args);
  		if (ret)
  			return optional ? NULL : ERR_PTR(ret);
 =20
  		gpio_fallback =3D true;
 =20
- 		ret =3D __reset_add_reset_gpio_device(&args);
+ 		ret =3D __reset_add_reset_gpio_device(fwnode, &args);
+ 		if (ret) {
+ 			fwnode_handle_put(args.fwnode);
+ 			return ERR_PTR(ret);
+ 		}
+ 	}
+=20
+ 	guard(mutex)(&reset_list_mutex);
+=20
+ 	rcdev =3D __reset_find_rcdev(&args, gpio_fallback);
+ 	if (!rcdev) {
+ 		rstc =3D ERR_PTR(-EPROBE_DEFER);
+ 		goto out_put;
+ 	}
+=20
+ 	if (WARN_ON(args.nargs !=3D rcdev->fwnode_reset_n_cells)) {
+ 		rstc =3D ERR_PTR(-EINVAL);
+ 		goto out_put;
+ 	}
+=20
+ 	if (rcdev->of_xlate && is_of_node(fwnode)) {
+ 		ret =3D of_parse_phandle_with_args(to_of_node(fwnode),
+ 					 gpio_fallback ? "reset-gpios" : "resets",
+ 					 gpio_fallback ? "#gpio-cells" : "#reset-cells",
+ 					 gpio_fallback ? 0 : index,
+ 					 &of_args);
  		if (ret) {
  			rstc =3D ERR_PTR(ret);
  			goto out_put;
  		}
- 	}
 =20
- 	mutex_lock(&reset_list_mutex);
- 	rcdev =3D __reset_find_rcdev(&args, gpio_fallback);
- 	if (!rcdev) {
- 		rstc =3D ERR_PTR(-EPROBE_DEFER);
- 		goto out_unlock;
+ 		rstc_id =3D rcdev->of_xlate(rcdev, &of_args);
+ 		of_node_put(of_args.np);
+ 	} else if (rcdev->fwnode_xlate) {
+ 		rstc_id =3D rcdev->fwnode_xlate(rcdev, &args);
  	}
-=20
- 	if (WARN_ON(args.args_count !=3D rcdev->of_reset_n_cells)) {
- 		rstc =3D ERR_PTR(-EINVAL);
- 		goto out_unlock;
- 	}
-=20
- 	rstc_id =3D rcdev->of_xlate(rcdev, &args);
  	if (rstc_id < 0) {
  		rstc =3D ERR_PTR(rstc_id);
- 		goto out_unlock;
+ 		goto out_put;
  	}
 =20
  	flags &=3D ~RESET_CONTROL_FLAGS_BIT_OPTIONAL;
 =20
- 	/* reset_list_mutex also protects the rcdev's reset_control list */
- 	rstc =3D __reset_control_get_internal(rcdev, rstc_id, flags);
+ 	scoped_guard(mutex, &rcdev->lock)
+ 		rstc =3D __reset_control_get_internal(rcdev, rstc_id, flags);
 =20
- out_unlock:
- 	mutex_unlock(&reset_list_mutex);
  out_put:
- 	of_node_put(args.np);
+ 	fwnode_handle_put(args.fwnode);
 =20
  	return rstc;
  }
- EXPORT_SYMBOL_GPL(__of_reset_control_get);
+ EXPORT_SYMBOL_GPL(__fwnode_reset_control_get);
 =20
  struct reset_control *__reset_control_get(struct device *dev, const char =
*id,
  					  int index, enum reset_control_flags flags)
@@@ -1079,12 -1237,13 +1237,13 @@@
  	bool shared =3D flags & RESET_CONTROL_FLAGS_BIT_SHARED;
  	bool acquired =3D flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
  	bool optional =3D flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
+ 	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
 =20
  	if (WARN_ON(shared && acquired))
  		return ERR_PTR(-EINVAL);
 =20
- 	if (dev->of_node)
- 		return __of_reset_control_get(dev->of_node, id, index, flags);
+ 	if (fwnode)
+ 		return __fwnode_reset_control_get(fwnode, id, index, flags);
 =20
  	return optional ? NULL : ERR_PTR(-ENOENT);
  }
@@@ -1107,10 -1266,9 +1266,9 @@@ int __reset_control_bulk_get(struct dev
  	return 0;
 =20
  err:
- 	mutex_lock(&reset_list_mutex);
  	while (i--)
- 		__reset_control_put_internal(rstcs[i].rstc);
- 	mutex_unlock(&reset_list_mutex);
+ 		reset_control_put_internal(rstcs[i].rstc);
+=20
  	return ret;
  }
  EXPORT_SYMBOL_GPL(__reset_control_bulk_get);
@@@ -1119,10 -1277,8 +1277,8 @@@ static void reset_control_array_put(str
  {
  	int i;
 =20
- 	mutex_lock(&reset_list_mutex);
  	for (i =3D 0; i < resets->num_rstcs; i++)
- 		__reset_control_put_internal(resets->rstc[i]);
- 	mutex_unlock(&reset_list_mutex);
+ 		reset_control_put_internal(resets->rstc[i]);
  	kfree(resets);
  }
 =20
@@@ -1140,9 -1296,7 +1296,7 @@@ void reset_control_put(struct reset_con
  		return;
  	}
 =20
- 	mutex_lock(&reset_list_mutex);
- 	__reset_control_put_internal(rstc);
- 	mutex_unlock(&reset_list_mutex);
+ 	reset_control_put_internal(rstc);
  }
  EXPORT_SYMBOL_GPL(reset_control_put);
 =20
@@@ -1153,10 -1307,8 +1307,8 @@@
   */
  void reset_control_bulk_put(int num_rstcs, struct reset_control_bulk_data=
 *rstcs)
  {
- 	mutex_lock(&reset_list_mutex);
  	while (num_rstcs--)
- 		__reset_control_put_internal(rstcs[num_rstcs].rstc);
- 	mutex_unlock(&reset_list_mutex);
+ 		reset_control_put_internal(rstcs[num_rstcs].rstc);
  }
  EXPORT_SYMBOL_GPL(reset_control_bulk_put);
 =20
@@@ -1317,21 -1469,35 +1469,35 @@@ EXPORT_SYMBOL_GPL(__device_reset)
   */
 =20
  /**
-  * of_reset_control_get_count - Count number of resets available with a d=
evice
+  * fwnode_reset_control_get_count - Count number of resets available with=
 a device
   *
-  * @node: device node that contains 'resets'.
+  * @fwnode: firmware node that contains 'resets'.
   *
   * Returns positive reset count on success, or error number on failure and
   * on count being zero.
   */
- static int of_reset_control_get_count(struct device_node *node)
+ static int fwnode_reset_control_get_count(struct fwnode_handle *fwnode)
  {
- 	int count;
+ 	struct fwnode_reference_args args;
+ 	int count =3D 0, ret;
 =20
- 	if (!node)
+ 	if (!fwnode)
  		return -EINVAL;
 =20
- 	count =3D of_count_phandle_with_args(node, "resets", "#reset-cells");
+ 	for (;;) {
+ 		ret =3D fwnode_property_get_reference_args(fwnode, "resets", "#reset-ce=
lls",
+ 							 0, count, &args);
+ 		if (ret) {
+ 			if (ret =3D=3D -ENOENT)
+ 				break;
+=20
+ 			return ret;
+ 		}
+=20
+ 		fwnode_handle_put(args.fwnode);
+ 		count++;
+ 	}
+=20
  	if (count =3D=3D 0)
  		count =3D -ENOENT;
 =20
@@@ -1339,23 -1505,24 +1505,24 @@@
  }
 =20
  /**
-  * of_reset_control_array_get - Get a list of reset controls using
-  *				device node.
+  * fwnode_reset_control_array_get - Get a list of reset controls using
+  *                                  a firmware node.
   *
-  * @np: device node for the device that requests the reset controls array
+  * @fwnode: firmware node for the device that requests the reset controls=
 array
   * @flags: whether reset controls are shared, optional, acquired
   *
   * Returns pointer to allocated reset_control on success or error on fail=
ure
   */
  struct reset_control *
- of_reset_control_array_get(struct device_node *np, enum reset_control_fla=
gs flags)
+ fwnode_reset_control_array_get(struct fwnode_handle *fwnode,
+ 			       enum reset_control_flags flags)
  {
  	bool optional =3D flags & RESET_CONTROL_FLAGS_BIT_OPTIONAL;
  	struct reset_control_array *resets;
  	struct reset_control *rstc;
  	int num, i;
 =20
- 	num =3D of_reset_control_get_count(np);
+ 	num =3D fwnode_reset_control_get_count(fwnode);
  	if (num < 0)
  		return optional ? NULL : ERR_PTR(num);
 =20
@@@ -1365,7 -1532,7 +1532,7 @@@
  	resets->num_rstcs =3D num;
 =20
  	for (i =3D 0; i < num; i++) {
- 		rstc =3D __of_reset_control_get(np, NULL, i, flags);
+ 		rstc =3D __fwnode_reset_control_get(fwnode, NULL, i, flags);
  		if (IS_ERR(rstc))
  			goto err_rst;
  		resets->rstc[i] =3D rstc;
@@@ -1375,16 -1542,14 +1542,14 @@@
  	return &resets->base;
 =20
  err_rst:
- 	mutex_lock(&reset_list_mutex);
  	while (--i >=3D 0)
- 		__reset_control_put_internal(resets->rstc[i]);
- 	mutex_unlock(&reset_list_mutex);
+ 		reset_control_put_internal(resets->rstc[i]);
 =20
  	kfree(resets);
 =20
  	return rstc;
  }
- EXPORT_SYMBOL_GPL(of_reset_control_array_get);
+ EXPORT_SYMBOL_GPL(fwnode_reset_control_array_get);
 =20
  /**
   * devm_reset_control_array_get - Resource managed reset control array get
@@@ -1408,7 -1573,7 +1573,7 @@@ devm_reset_control_array_get(struct dev
  	if (!ptr)
  		return ERR_PTR(-ENOMEM);
 =20
- 	rstc =3D of_reset_control_array_get(dev->of_node, flags);
+ 	rstc =3D fwnode_reset_control_array_get(dev_fwnode(dev), flags);
  	if (IS_ERR_OR_NULL(rstc)) {
  		devres_free(ptr);
  		return rstc;
@@@ -1431,8 -1596,10 +1596,10 @@@ EXPORT_SYMBOL_GPL(devm_reset_control_ar
   */
  int reset_control_get_count(struct device *dev)
  {
- 	if (dev->of_node)
- 		return of_reset_control_get_count(dev->of_node);
+ 	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
+=20
+ 	if (fwnode)
+ 		return fwnode_reset_control_get_count(fwnode);
 =20
  	return -ENOENT;
  }

--pnTA1K8BTMGG8t8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBUVcACgkQJNaLcl1U
h9CBNgf/fJ0b/8p+K12Nv1Nv6qNtLloYq/AhgffQNSmTwezfEuUew6d7Fi5rg2s4
bvimZodrnNlOwFxEZW08fm+7X5CXZhJw1QTvWk+Ko3m7/yuU+ktml/xRlzyOBpj8
7v30mrovkFuTmu8Ywi3Iqhsd7E6e8vcarDAZVzYl4pUbrx4lsHViHFeg6bx95lqW
yjAxraHBpxo66kWlRZJbhv30dfvhPqkX8lYnP6JNaHYwEEbo4ISpqvVKftmb3Msf
PWHYOY+xrj+e2cNIln6T/qhIs+VJp2imzCXH+DEI/VzgiU3LnAvFKu/iV/WjcaZO
fZ8nJiN0VxfHtiDNiHXOKUJqNnLGsQ==
=5Jx9
-----END PGP SIGNATURE-----

--pnTA1K8BTMGG8t8X--
