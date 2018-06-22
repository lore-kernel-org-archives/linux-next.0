From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Date: Fri, 22 Jun 2018 11:56:54 +1000
Message-ID: <20180622115654.04cef951@canb.auug.org.au>
References: <20180622115346.1e9cc433@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OWNquzA9DJZdnomFF/PgTEG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622115346.1e9cc433@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OWNquzA9DJZdnomFF/PgTEG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 22 Jun 2018 11:53:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> diff --cc arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> index 38a54f56ff40,7b4a09d81a30..000000000000
> --- a/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> +++ b/arch/x86/kernel/cpu/intel_rdt_rdtgroup.c
> @@@ -1270,9 -1861,16 +1842,15 @@@ static int rdt_get_tree(struct fs_conte
>   		rdtgroup_default.mon.mon_data_kn =3D kn_mondata;
>   	}
>  =20
> + 	ret =3D rdt_pseudo_lock_init();
> + 	if (ret) {
> + 		dentry =3D ERR_PTR(ret);

Actually I have removed the above line as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/OWNquzA9DJZdnomFF/PgTEG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlssV2cACgkQAVBC80lX
0GwK/Af9GKb4Sdcrjz20E8fA986ylWklsNrUoVQvw6qi+fgG6GNTEu9rCYXHUZ11
8UVxzXzZu54hIuaJSEUsureCpzvtP9gZ/zV//5l9C0rH3wNhVfQ8OWWRN686BfnJ
R626P2q+mFzdMX0ZIGD6fgoTFcZvu+XOrR/dPtjV5SwbdujmxFu6mgFwBFJnGOOI
dypRWz6/hFtd5QMazoXXZOIMaB3WUq9KGvPG4uoNHiQ90LQwXOFKX3bV+nqoXisU
RBhlfmHURUmyFf6yYb4PQOt9SqmzFg8tYBsu0brjTDrJwbf5yXrU6P0vFuBYCWZn
Bwlify6x7UlwCIs9WBgvJg4NQG6VtQ==
=iYIR
-----END PGP SIGNATURE-----

--Sig_/OWNquzA9DJZdnomFF/PgTEG--
