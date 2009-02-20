From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 19:59:11 +1100
Message-ID: <20090220195911.3bff30fb.sfr@canb.auug.org.au>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__20_Feb_2009_19_59_11_+1100_n.C6rCXwh1n+4_bU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45841 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752081AbZBTI7T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 03:59:19 -0500
In-Reply-To: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Pekka Enberg <penberg@cs.helsinki.fi>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Fri__20_Feb_2009_19_59_11_+1100_n.C6rCXwh1n+4_bU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Feb 2009 16:57:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> @@@ -2723,18 -2689,9 +2727,19 @@@ static void *kmalloc_large_node(size_t=
=20
>   void *__kmalloc_node(size_t size, gfp_t flags, int node)
>   {
>   	struct kmem_cache *s;
>  +	void *ret;
>  =20
>  -	if (unlikely(size > SLUB_MAX_SIZE))
>  -		return kmalloc_large_node(size, flags, node);
> ++	if (unlikely(size > SLUB_MAX_SIZE)) {
>  +	if (unlikely(size > PAGE_SIZE)) {

Except I screwed that up.  I meant to delete the last line above.  I will
add a patch to the end of linux-next for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__20_Feb_2009_19_59_11_+1100_n.C6rCXwh1n+4_bU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmecN8ACgkQjjKRsyhoI8zoYgCfYOyN5pZXqRPwF6s/ecMmccPz
okIAn1SDVldJMod5kN4b9E9L/TpIVzsR
=vLRI
-----END PGP SIGNATURE-----

--Signature=_Fri__20_Feb_2009_19_59_11_+1100_n.C6rCXwh1n+4_bU--
