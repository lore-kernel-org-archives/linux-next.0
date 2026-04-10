Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F30347FC8;
	Fri, 10 Apr 2026 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827892; cv=none; b=iUt/mXNCQEdEZOtH73bAxhbV6dBDfR46OPPA/P2yV8cZ6DCqBaowbIsB3RbRnLiPC6x3fwud8ZH4iKEyaHdrYYz2QLSNxeRZSjJfscFmZinXugGgDovUNPPQ48531WpxYqARyDstceT5SSIkaHGDb2fKjdGJ1rZrKyzRDxIGGtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827892; c=relaxed/simple;
	bh=7SyECkYsU4Imbba22GH6GF0VL5SkUDE91yplTsV4ec0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4PnB2RPQwqssxtfvX2JeZcLqJ2WzUVNAxOBhGjhN8utGvDTVT9c77LuL1NxbQDSsK5IF+xTK1iLB+NWroLYbDt8xWxMkz2h2PZ+mPlJbReNhW0V1KBeFjIT/5h7Kwggmy3ZcRVE5gx0v2FfxdkNPWzLx7oEEXCFtnXCpVI/ou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2F8HuJb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2F8HuJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0BCC19421;
	Fri, 10 Apr 2026 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827892;
	bh=7SyECkYsU4Imbba22GH6GF0VL5SkUDE91yplTsV4ec0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2F8HuJbE2LEuoiSDLWHatZnqxvb+T0iCZsVOXinTfG2dHCor+bcGGNoeuTQSVU/a
	 mSESsc8Z7kZStFwuoQRP4FnIPU1uzn+gXAVEBPYxF1y7I618s3nQv+vc1yiwcvPugw
	 mzL21eENFxAFdZ1YH1sVQR8ZnRG/1Ew8LEbRHayFT5DXrwC051JEHnbTMbq5WM3s/o
	 ctUU34aGoHZU7MGT6KGS6xr6oQvG9Sr4l8GyCRC9H+2Zn4kuV7756Nu7GdyG751bZ0
	 jiEbHEILzehBLOuGnBdHluyWQAzlUV063SkU0NFAOsY4eaExryTBgmLK2Z1+jjkOHL
	 9inr5+ZSQeEJg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 719DE1AC58B5; Fri, 10 Apr 2026 14:31:29 +0100 (BST)
Date: Fri, 10 Apr 2026 14:31:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Josua Mayer <josua@solid-run.com>,
	Linus Walleij <linusw@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Ulf Hansson <ulfh@kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the mmc tree
Message-ID: <adj7sSzHRAPGlVpT@sirena.co.uk>
References: <adj61MnOca5D8-rA@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwVvdEjJTQY8TwBn"
Content-Disposition: inline
In-Reply-To: <adj61MnOca5D8-rA@sirena.co.uk>
X-Cookie: You will be divorced within a year.


--dwVvdEjJTQY8TwBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 02:27:48PM +0100, Mark Brown wrote:
> Hi all,
>=20
> Today's linux-next merge of the pinctrl tree got extensive and
> concerning conflicts in:

Replacing Linus' address.

>=20
>   include/linux/mux/consumer.h
>   drivers/mux/core.c
>=20
> between commit:
>=20
>   993bcaf32c4940 ("mux: Add helper functions for getting optional and sel=
ected mux-state")
>=20
> from the mmc tree and commit:
>=20
>   bb23f1b8c28be9 ("mux: add devm_mux_control_get_from_np() to get mux fro=
m child node")
>=20
> from the pinctrl tree, I'm not convinced that the latter commit is ready
> as devm_get_mux_control_from_np() appears to ignore the np parameter.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> This fixup is very quick and hacky, I don't have huge confidence in it.
> Indeed since making it I see more failures due to devm_mux_control_get()
> not being exported, I have a hard time seeing how exactly
> devm_get_mux_control_from_np() is intended to work given that it ignores
> the np parameter and is just a straight rename/reprototype of that
> function.
>=20
> diff --cc drivers/mux/core.c
> index 23538de2c91b41,9ca16b37d389b2..00000000000000
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@@ -532,15 -522,15 +532,17 @@@ static struct mux_chip *of_find_mux_chi
>    * @mux_name: The name identifying the mux-control.
>    * @state: Pointer to where the requested state is returned, or NULL wh=
en
>    *         the required multiplexer states are handled by other means.
>  + * @optional: Whether to return NULL and silence errors when mux doesn'=
t exist.
> +  * @node: the device nodes, use dev->of_node if it is NULL.
>    *
>  - * Return: A pointer to the mux-control, or an ERR_PTR with a negative =
errno.
>  + * Return: Pointer to the mux-control on success, an ERR_PTR with a neg=
ative
>  + * errno on error, or NULL if optional is true and mux doesn't exist.
>    */
>   static struct mux_control *mux_get(struct device *dev, const char *mux_=
name,
> - 				   unsigned int *state, bool optional)
>  -				   unsigned int *state,
> ++				   unsigned int *state, bool optional,
> + 				   struct device_node *node)
>   {
> - 	struct device_node *np =3D dev->of_node;
> + 	struct device_node *np =3D node ? node : dev->of_node;
>   	struct of_phandle_args args;
>   	struct mux_chip *mux_chip;
>   	unsigned int controller;
> @@@ -635,29 -619,10 +637,29 @@@
>    */
>   struct mux_control *mux_control_get(struct device *dev, const char *mux=
_name)
>   {
> - 	struct mux_control *mux =3D mux_get(dev, mux_name, NULL, false);
>  -	return mux_get(dev, mux_name, NULL, NULL);
> ++	struct mux_control *mux =3D mux_get(dev, mux_name, NULL, false, NULL);
>  +
>  +	if (!mux)
>  +		return ERR_PTR(-ENOENT);
>  +
>  +	return mux;
>   }
>   EXPORT_SYMBOL_GPL(mux_control_get);
>  =20
>  +/**
>  + * mux_control_get_optional() - Get the optional mux-control for a devi=
ce.
>  + * @dev: The device that needs a mux-control.
>  + * @mux_name: The name identifying the mux-control.
>  + *
>  + * Return: Pointer to the mux-control on success, an ERR_PTR with a neg=
ative
>  + * errno on error, or NULL if mux doesn't exist.
>  + */
>  +struct mux_control *mux_control_get_optional(struct device *dev, const =
char *mux_name)
>  +{
> - 	return mux_get(dev, mux_name, NULL, true);
> ++	return mux_get(dev, mux_name, NULL, true, NULL);
>  +}
>  +EXPORT_SYMBOL_GPL(mux_control_get_optional);
>  +
>   /**
>    * mux_control_put() - Put away the mux-control for good.
>    * @mux: The mux-control to put away.
> @@@ -705,18 -672,18 +709,20 @@@ devm_mux_control_get_from_np(struct dev
>  =20
>   	return mux;
>   }
> - EXPORT_SYMBOL_GPL(devm_mux_control_get);
> + EXPORT_SYMBOL_GPL(devm_mux_control_get_from_np);
>  =20
>  -/*
>  +/**
>    * mux_state_get() - Get the mux-state for a device.
>    * @dev: The device that needs a mux-state.
>    * @mux_name: The name identifying the mux-state.
>  + * @optional: Whether to return NULL and silence errors when mux doesn'=
t exist.
> +  * @np: the device nodes, use dev->of_node if it is NULL.
>    *
>  - * Return: A pointer to the mux-state, or an ERR_PTR with a negative er=
rno.
>  + * Return: Pointer to the mux-state on success, an ERR_PTR with a negat=
ive
>  + * errno on error, or NULL if optional is true and mux doesn't exist.
>    */
> - static struct mux_state *mux_state_get(struct device *dev, const char *=
mux_name, bool optional)
> + static struct mux_state *
>  -mux_state_get(struct device *dev, const char *mux_name, struct device_n=
ode *np)
> ++mux_state_get(struct device *dev, const char *mux_name, bool optional, =
struct device_node *np)
>   {
>   	struct mux_state *mstate;
>  =20
> @@@ -724,7 -691,7 +730,7 @@@
>   	if (!mstate)
>   		return ERR_PTR(-ENOMEM);
>  =20
> - 	mstate->mux =3D mux_get(dev, mux_name, &mstate->state, optional);
>  -	mstate->mux =3D mux_get(dev, mux_name, &mstate->state, np);
> ++	mstate->mux =3D mux_get(dev, mux_name, &mstate->state, optional, np);
>   	if (IS_ERR(mstate->mux)) {
>   		int err =3D PTR_ERR(mstate->mux);
>  =20
> @@@ -752,139 -716,43 +758,162 @@@ static void mux_state_put(struct mux_st
>  =20
>   static void devm_mux_state_release(struct device *dev, void *res)
>   {
>  -	struct mux_state *mstate =3D *(struct mux_state **)res;
>  +	struct devm_mux_state_state *devm_state =3D res;
>  =20
>  +	if (devm_state->exit)
>  +		devm_state->exit(devm_state->mstate);
>  +
>  +	mux_state_put(devm_state->mstate);
>  +}
>  +
>  +/**
>  + * __devm_mux_state_get() - Get the optional mux-state for a device,
>  + *			    with resource management.
>  + * @dev: The device that needs a mux-state.
>  + * @mux_name: The name identifying the mux-state.
>  + * @optional: Whether to return NULL and silence errors when mux doesn'=
t exist.
>  + * @init: Optional function pointer for mux-state object initialisation.
>  + * @exit: Optional function pointer for mux-state object cleanup on rel=
ease.
>  + *
>  + * Return: Pointer to the mux-state on success, an ERR_PTR with a negat=
ive
>  + * errno on error, or NULL if optional is true and mux doesn't exist.
>  + */
>  +static struct mux_state *__devm_mux_state_get(struct device *dev, const=
 char *mux_name,
>  +					      bool optional,
>  +					      int (*init)(struct mux_state *mstate),
>  +					      int (*exit)(struct mux_state *mstate))
>  +{
>  +	struct devm_mux_state_state *devm_state;
>  +	struct mux_state *mstate;
>  +	int ret;
>  +
> - 	mstate =3D mux_state_get(dev, mux_name, optional);
> ++	mstate =3D mux_state_get(dev, mux_name, optional, NULL);
>  +	if (IS_ERR(mstate))
>  +		return ERR_CAST(mstate);
>  +	else if (optional && !mstate)
>  +		return NULL;
>  +	else if (!mstate)
>  +		return ERR_PTR(-ENOENT);
>  +
>  +	devm_state =3D devres_alloc(devm_mux_state_release, sizeof(*devm_state=
), GFP_KERNEL);
>  +	if (!devm_state) {
>  +		ret =3D -ENOMEM;
>  +		goto err_devres_alloc;
>  +	}
>  +
>  +	if (init) {
>  +		ret =3D init(mstate);
>  +		if (ret)
>  +			goto err_mux_state_init;
>  +	}
>  +
>  +	devm_state->mstate =3D mstate;
>  +	devm_state->exit =3D exit;
>  +	devres_add(dev, devm_state);
>  +
>  +	return mstate;
>  +
>  +err_mux_state_init:
>  +	devres_free(devm_state);
>  +err_devres_alloc:
>   	mux_state_put(mstate);
>  +	return ERR_PTR(ret);
>  +}
>  +
> ++struct mux_state *devm_mux_state_get(struct device *dev, const char *mu=
x_name)
> ++{
> ++	return __devm_mux_state_get(dev, mux_name, false, NULL, NULL);
> + }
> +=20
>   /**
> -  * devm_mux_state_get() - Get the mux-state for a device, with resource
> -  *			  management.
> +  * devm_mux_state_get_from_np() - Get the mux-state for a device, with =
resource
> +  *				  management.
>    * @dev: The device that needs a mux-control.
>    * @mux_name: The name identifying the mux-control.
> +  * @np: the device nodes, use dev->of_node if it is NULL.
>    *
>    * Return: Pointer to the mux-state, or an ERR_PTR with a negative errn=
o.
>  + *
>  + * The mux-state will automatically be freed on release.
>    */
> - struct mux_state *devm_mux_state_get(struct device *dev, const char *mu=
x_name)
> + struct mux_state *
> + devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
> + 			   struct device_node *np)
>   {
> - 	return __devm_mux_state_get(dev, mux_name, false, NULL, NULL);
> + 	struct mux_state **ptr, *mstate;
> +=20
> + 	ptr =3D devres_alloc(devm_mux_state_release, sizeof(*ptr), GFP_KERNEL);
> + 	if (!ptr)
> + 		return ERR_PTR(-ENOMEM);
> +=20
>  -	mstate =3D mux_state_get(dev, mux_name, np);
> ++	mstate =3D mux_state_get(dev, mux_name, false, np);
> + 	if (IS_ERR(mstate)) {
> + 		devres_free(ptr);
> + 		return mstate;
> + 	}
> +=20
> + 	*ptr =3D mstate;
> + 	devres_add(dev, ptr);
> +=20
> + 	return mstate;
>   }
> - EXPORT_SYMBOL_GPL(devm_mux_state_get);
> + EXPORT_SYMBOL_GPL(devm_mux_state_get_from_np);
>  =20
>  +/**
>  + * devm_mux_state_get_optional() - Get the optional mux-state for a dev=
ice,
>  + *				   with resource management.
>  + * @dev: The device that needs a mux-state.
>  + * @mux_name: The name identifying the mux-state.
>  + *
>  + * Return: Pointer to the mux-state on success, an ERR_PTR with a negat=
ive
>  + * errno on error, or NULL if mux doesn't exist.
>  + *
>  + * The mux-state will automatically be freed on release.
>  + */
>  +struct mux_state *devm_mux_state_get_optional(struct device *dev, const=
 char *mux_name)
>  +{
>  +	return __devm_mux_state_get(dev, mux_name, true, NULL, NULL);
>  +}
>  +EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
>  +
>  +/**
>  + * devm_mux_state_get_selected() - Get the mux-state for a device, with
>  + *				   resource management.
>  + * @dev: The device that needs a mux-state.
>  + * @mux_name: The name identifying the mux-state.
>  + *
>  + * Return: Pointer to the mux-state, or an ERR_PTR with a negative errn=
o.
>  + *
>  + * The returned mux-state (if valid) is already selected.
>  + *
>  + * The mux-state will automatically be deselected and freed on release.
>  + */
>  +struct mux_state *devm_mux_state_get_selected(struct device *dev, const=
 char *mux_name)
>  +{
>  +	return __devm_mux_state_get(dev, mux_name, false, mux_state_select, mu=
x_state_deselect);
>  +}
>  +EXPORT_SYMBOL_GPL(devm_mux_state_get_selected);
>  +
>  +/**
>  + * devm_mux_state_get_optional_selected() - Get the optional mux-state =
for
>  + *					    a device, with resource management.
>  + * @dev: The device that needs a mux-state.
>  + * @mux_name: The name identifying the mux-state.
>  + *
>  + * Return: Pointer to the mux-state on success, an ERR_PTR with a negat=
ive
>  + * errno on error, or NULL if mux doesn't exist.
>  + *
>  + * The returned mux-state (if valid) is already selected.
>  + *
>  + * The mux-state will automatically be deselected and freed on release.
>  + */
>  +struct mux_state *devm_mux_state_get_optional_selected(struct device *d=
ev,
>  +						       const char *mux_name)
>  +{
>  +	return __devm_mux_state_get(dev, mux_name, true, mux_state_select, mux=
_state_deselect);
>  +}
>  +EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
>  +
>   /*
>    * Using subsys_initcall instead of module_init here to try to ensure -=
 for
>    * the non-modular case - that the subsystem is initialized when mux co=
nsumers
> diff --cc include/linux/mux/consumer.h
> index a961861a503b33,6300e091035323..00000000000000
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@@ -55,110 -53,20 +55,118 @@@ static inline int __must_check mux_stat
>   int mux_control_deselect(struct mux_control *mux);
>   int mux_state_deselect(struct mux_state *mstate);
>  =20
>  -struct mux_control *mux_control_get(struct device *dev, const char *mux=
_name);
>  -void mux_control_put(struct mux_control *mux);
>  -
> + struct mux_control *
> + devm_mux_control_get_from_np(struct device *dev, const char *mux_name,
> + 			     struct device_node *np);
> +=20
>  -#define devm_mux_control_get(dev, mux_name)		\
>  -	devm_mux_control_get_from_np(dev, mux_name, NULL)
>  -
> + struct mux_state *
> + devm_mux_state_get_from_np(struct device *dev, const char *mux_name,
> + 			   struct device_node *np);
>  -#define devm_mux_state_get(dev, mux_name)		\
>  -	devm_mux_state_get_from_np(dev, mux_name, NULL)
> ++
>  +struct mux_control *mux_control_get(struct device *dev, const char *mux=
_name);
>  +struct mux_control *mux_control_get_optional(struct device *dev, const =
char *mux_name);
>  +void mux_control_put(struct mux_control *mux);
>  +
>  +struct mux_control *devm_mux_control_get(struct device *dev, const char=
 *mux_name);
>  +struct mux_state *devm_mux_state_get(struct device *dev, const char *mu=
x_name);
>  +struct mux_state *devm_mux_state_get_optional(struct device *dev, const=
 char *mux_name);
>  +struct mux_state *devm_mux_state_get_selected(struct device *dev, const=
 char *mux_name);
>  +struct mux_state *devm_mux_state_get_optional_selected(struct device *d=
ev, const char *mux_name);
>  +
>  +#else
>  +
>  +static inline unsigned int mux_control_states(struct mux_control *mux)
>  +{
>  +	return 0;
>  +}
>  +static inline int __must_check mux_control_select_delay(struct mux_cont=
rol *mux,
>  +							unsigned int state, unsigned int delay_us)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +static inline int __must_check mux_state_select_delay(struct mux_state =
*mstate,
>  +						      unsigned int delay_us)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +static inline int __must_check mux_control_try_select_delay(struct mux_=
control *mux,
>  +							    unsigned int state,
>  +							    unsigned int delay_us)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +static inline int __must_check mux_state_try_select_delay(struct mux_st=
ate *mstate,
>  +							  unsigned int delay_us)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline int __must_check mux_control_select(struct mux_control *m=
ux,
>  +						  unsigned int state)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline int __must_check mux_state_select(struct mux_state *mstat=
e)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline int __must_check mux_control_try_select(struct mux_contro=
l *mux,
>  +						      unsigned int state)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline int __must_check mux_state_try_select(struct mux_state *m=
state)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline int mux_control_deselect(struct mux_control *mux)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +static inline int mux_state_deselect(struct mux_state *mstate)
>  +{
>  +	return -EOPNOTSUPP;
>  +}
>  +
>  +static inline struct mux_control *mux_control_get(struct device *dev, c=
onst char *mux_name)
>  +{
>  +	return ERR_PTR(-EOPNOTSUPP);
>  +}
>  +static inline struct mux_control *mux_control_get_optional(struct devic=
e *dev,
>  +							   const char *mux_name)
>  +{
>  +	return NULL;
>  +}
>  +static inline void mux_control_put(struct mux_control *mux) {}
>  +
>  +static inline struct mux_control *devm_mux_control_get(struct device *d=
ev, const char *mux_name)
>  +{
>  +	return ERR_PTR(-EOPNOTSUPP);
>  +}
>  +static inline struct mux_state *devm_mux_state_get(struct device *dev, =
const char *mux_name)
>  +{
>  +	return ERR_PTR(-EOPNOTSUPP);
>  +}
>  +static inline struct mux_state *devm_mux_state_get_optional(struct devi=
ce *dev,
>  +							    const char *mux_name)
>  +{
>  +	return NULL;
>  +}
>  +static inline struct mux_state *devm_mux_state_get_selected(struct devi=
ce *dev,
>  +							    const char *mux_name)
>  +{
>  +	return ERR_PTR(-EOPNOTSUPP);
>  +}
>  +static inline struct mux_state *devm_mux_state_get_optional_selected(st=
ruct device *dev,
>  +								     const char *mux_name)
>  +{
>  +	return NULL;
>  +}
>  +
>  +#endif /* CONFIG_MULTIPLEXER */
>  =20
>   #endif /* _LINUX_MUX_CONSUMER_H */



--dwVvdEjJTQY8TwBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY+7AACgkQJNaLcl1U
h9D6hwf/cNQkZAJR9IS2JhAyYBf/LI7zJwU2Vvq/wnNwJFJIKbRmXAbOtFNAE3xr
XaNbTl1CTJfev6MxGu0x8NCpBinMs/nFtGAOFL1g9y7bTwCEPJyWgaWdXtiVTrSM
tND+ECqSxi4IR0fJ+EH3dlvKLwq/55igywWICXUwbKnpqO8PLVKRYD+3yNu6X8E+
6DPs23Cwuk2vNxkJByLEbHIRiDCtBj1GFq7NakXm9/GH6XraErX2oZTgn7gDkq0g
JIncxJp/Duw1CVOM8VelpkBH3N7SX1DJU8I9g6R5g02pHDCPiZT2amyT3CBdBFn5
w/U43otilxqTNGxYN9f9mWPOv2iIDA==
=E25w
-----END PGP SIGNATURE-----

--dwVvdEjJTQY8TwBn--
