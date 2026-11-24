Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533761;
	b=vR/e1sQDKpPUXkq8RBTwyOQmP3tsKbn8DbgVoPmtY8YqVeBOIMJHhv/wg3HiaVlOnLgu
	 58l9lPsbhk/OMehZ0sX/NyLSNjdEvZSNO0DqI1Fr2WJ8l4dRoopLLAcR/BEmvrBNKY404
	 YYrWWQ8At1wv//imXGKMto5/8aOjYwS/TQVs9El1edM+HUixV8vwVOUF9EGstL8KlVTsw
	 Jd5MCUyua5rGUt/KCz+xR1GePHlL153mwp2AsSdBsY6gJEbLxmai7iwwZzEobdlYfmnfB
	 EERbJ+TkQoTkOf5/JFljhB/xPIYKELNaE0nkrHQIwHT3lP4MLzHJp539XAVYp84aYUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533761;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=rUSlWiMmTskfVsgOz0LZI6AW1duqwGYirj3vzlmXmVI=;
	b=4grocQHLY9RqYtfmNgfcTYkoVGNcypiCWXR8imM0dD4xgJZquZHNCWwhkrIz+IslWiYK
	 pzj15Vw0Y8MUSQMzWIJHtgngIAHz1v+D50wQ7GOVFvCkocS+8L2hdfYltHpQkI414cqi9
	 EGAg681CBdqUfKwDkmeFCBTm6OxNKNE9Cq9t8+tTMttDiTwdmBEY+dcdqvavXihN0L/AW
	 QgCGBbUYt+oOl4ZOPF2AWfuwIqpxBcLKpqGeG9UBJYc3pJ2G/X6rFcB7zfzXzt4Cp7MvQ
	 Folis8rdv2WdcqEKrnDeMCu81/ECcTtvkrthOA39YEVLPDBDBfBcrvwjK2TTHrezkeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fozh/1pp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7A606A31E;
	Tue, 24 Nov 2026 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fozh/1pp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F041F000C4;
	Tue, 24 Nov 2026 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533760;
	bh=rUSlWiMmTskfVsgOz0LZI6AW1duqwGYirj3vzlmXmVI=;
	h=Date:From:To:Cc:Subject;
	b=Fozh/1ppPOZIjOLvZ4jQwv5GNDwhUO6hZJ/G8o4gnpjp056vsYtbm/lQze2umuPnR
	 anb3ubJYaduQOlKDkKoGsyFcWa9v+1D3j7/1RH6pX2xxaSdIVg++zM4cRDG1o4FQqp
	 yVCr5Nz2s19NUeWO12HDY4Y9FWK6TmKx8FBuf5rlaSW4HGVNdXyOTscr0QZ0TqwdKE
	 utGWZElK4N/eNRMuIbnUcBfclqGcBkN4YH7QK8NZs7HsGRxg6W/JYXLZfEXO/McRMm
	 6kii3T0JuNsPFwC2PHTeWIBr4yKxStqEvmGKHgkjibvEWiMLzixcUycl0KVci4pywe
	 0nVAEoDDJVf/g==
Date: Tue, 24 Nov 2026 15:22:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Alistair Popple <apopple@nvidia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Networking <netdev@vger.kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: linux-next: manual merge of the drm-misc tree with the net-next tree
Message-ID: <awWru6py7DqF3xJD@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SJSvMh+EHNwmA8Q2"
Content-Disposition: inline


--SJSvMh+EHNwmA8Q2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  net/core/devmem.c

between commits:

  ede1618064a9b ("net: devmem: detach TX bindings on NETDEV_UNREGISTER")
  c4466d2c3e776 ("net: devmem: unmap dma_buf synchronously on queue uninsta=
ll")

=66rom the net-next tree and commit:

  77e0b2d2f4f37 ("treewide: Rename dma_buf_(un)map_attachment() to dma_buf_=
(un)map_sgt()")

=66rom the drm-misc tree.  I'm not sure this is an ideal time to be doing
tree wide refactorings...

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc net/core/devmem.c
index 3714364b5d9a5,a638aa3e806b7..0000000000000
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@@ -67,84 -64,6 +67,84 @@@ static void net_devmem_dmabuf_binding_r
  	schedule_work(&binding->unbind_w);
  }
 =20
 +static void
 +net_devmem_dmabuf_binding_unmap(struct net_devmem_dmabuf_binding *binding)
 +{
 +	mutex_lock(&binding->lock);
 +	if (binding->sgt) {
 +		dma_resv_lock(binding->dmabuf->resv, NULL);
- 		dma_buf_unmap_attachment(binding->attachment, binding->sgt,
- 					 binding->direction);
++		dma_buf_unmap_sgt(binding->attachment, binding->sgt,
++				  binding->direction);
 +		dma_buf_unpin(binding->attachment);
 +		dma_resv_unlock(binding->dmabuf->resv);
 +		dma_buf_detach(binding->dmabuf, binding->attachment);
 +		binding->sgt =3D NULL;
 +		binding->attachment =3D NULL;
 +	}
 +	mutex_unlock(&binding->lock);
 +}
 +
 +/**
 + * net_devmem_lock_dev() - lock a binding's net_device if still alive
 + * @binding:		devmem binding whose @dev pointer to lock
 + * @dev_tracker:	reftracker for the held net_device reference
 + *
 + * Safely dereference @binding->dev, acquire netdev_lock() on the device,=
 and
 + * verify that @binding->dev has not been cleared while waiting for the l=
ock.
 + *
 + * Invariant: @binding->dev is set once at bind time and is only ever cle=
ared to
 + * NULL while holding netdev_lock(dev) (in mp_dmabuf_devmem_uninstall(),
 + * net_devmem_unbind_dmabuf(), or net_devmem_dev_unregister() during
 + * NETDEV_UNREGISTER before synchronize_net() and netdev_run_todo() free =
the
 + * net_device).
 + *
 + * Taking rcu_read_lock() guarantees that a non-NULL @dev read from
 + * @binding->dev has not yet completed unregister_netdevice_many_notify()
 + * (which waits for an RCU grace period via synchronize_net() after
 + * NETDEV_UNREGISTER before freeing the net_device), so netdev_hold() can
 + * safely acquire a reference before sleeping on netdev_lock(). Once
 + * netdev_lock(dev) is held, re-checking that READ_ONCE(binding->dev) =3D=
=3D dev
 + * guarantees that the device has not yet been detached from @binding and
 + * cannot finish unregistering until net_devmem_unlock_dev().
 + *
 + * Return: The locked and held net_device if @binding->dev is still non-N=
ULL,
 + * or NULL if already cleared.
 + */
 +struct net_device *
 +net_devmem_lock_dev(struct net_devmem_dmabuf_binding *binding,
 +		    netdevice_tracker *dev_tracker)
 +{
 +	struct net_device *dev;
 +
 +	rcu_read_lock();
 +	dev =3D READ_ONCE(binding->dev);
 +	if (!dev) {
 +		rcu_read_unlock();
 +		return NULL;
 +	}
 +	netdev_hold(dev, dev_tracker, GFP_ATOMIC);
 +	rcu_read_unlock();
 +
 +	netdev_lock(dev);
 +	if (READ_ONCE(binding->dev) !=3D dev) {
 +		netdev_unlock(dev);
 +		netdev_put(dev, dev_tracker);
 +		return NULL;
 +	}
 +
 +	return dev;
 +}
 +
 +void net_devmem_unlock_dev(struct net_device *dev,
 +			   netdevice_tracker *dev_tracker)
 +{
 +	if (!dev)
 +		return;
 +
 +	netdev_unlock(dev);
 +	netdev_put(dev, dev_tracker);
 +}
 +
  void __net_devmem_dmabuf_binding_free(struct work_struct *wq)
  {
  	struct net_devmem_dmabuf_binding *binding =3D container_of(wq, typeof(*b=
inding), unbind_w);

--SJSvMh+EHNwmA8Q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsFq7oACgkQJNaLcl1U
h9BoaQf+Pf2MBlTrwHV7LBf1OK0NKLZZ6D71LmfJW3avr2B84OhEJ4s0OYiP5954
SNQ2YIjyn8f8xrpjFEYIHv2NkgJExHFozNC1b3khRJzqX6ExBmCW33qYD+U7shl7
LCQDCDt8cn6sBLUkcpVhiDd9RitUK17eLV9F9gVvJ4tp743jvNxmr77+eOe8RwWV
4JDCZdcAJaEaK55z6ckJ69FpzNC0wDmALaO+S8Bz3rde4bREMFWeu5dsQ+GsQCuS
QxyQenExXFTstHnMpyAJFOX5HF7edmjO9Bgmsl2yyjn5M3g8rZZs7foweX4bxJLq
Vbq910CKZXddl8pkrXteumQzeUUlNw==
=aNOo
-----END PGP SIGNATURE-----

--SJSvMh+EHNwmA8Q2--
