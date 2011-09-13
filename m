From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Temporary -rcu tree location
Date: Tue, 13 Sep 2011 12:07:16 +1000
Message-ID: <20110913120716.1b893c483ee91d6b7f12a5b4@canb.auug.org.au>
References: <20110913000107.GA15945@linux.vnet.ibm.com>
	<alpine.LRH.2.00.1109130210090.19238@twin.jikos.cz>
	<20110913002419.GN2362@linux.vnet.ibm.com>
	<alpine.LNX.2.00.1109130242440.13109@pobox.suse.cz>
	<20110913013400.GB2313@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__13_Sep_2011_12_07_16_+1000_WNpWN_ZmRZq5vp5W"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110913013400.GB2313@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__13_Sep_2011_12_07_16_+1000_WNpWN_ZmRZq5vp5W
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, 12 Sep 2011 18:34:00 -0700 "Paul E. McKenney" <paulmck@linux.vnet.i=
bm.com> wrote:
>
> > there doesn't seem to be 'rcu/next' branch, right?
>=20
> No, there is not.  So the idea is to push "rcu/next" the first time,
> then ":rcu/next" thereafter?

Can't you just do a (forced) push over and over again without removing
the branch each time?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__13_Sep_2011_12_07_16_+1000_WNpWN_ZmRZq5vp5W
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJObrrUAAoJEDMEi1NhKgbs/e8H/A/Kf9vXJZhpiG9yDcfjvKl2
YQ7fg5d4gW368Ab3DLrH9R7QocHfnUwU3oTIiwrOHHnrfdzoYMNlnUKN26Mh5nza
3WMx5sVUbAL60+p+BJdmFKZAmHASvcjJD+dopXjjI/tyn1ZQ9IVNqHl/9WGtPPGP
kAK+ykGrw6MQKDfI2d/3Ztlao0WVt/Puug8NNd5aVwfomwWY3VBru5ml4MnkG+R5
KgEQMO9RytDtnmC9N/DVZmIythxVZrxLIKCsf3r6hyUsupRkoSYWmyoqRBJ62OGM
zCR8SwUwUdhpO3GIVRCU1M4ZaMFX55votfSi6vmW5VFuoferGDkop5l2tWWZMh4=
=lGqs
-----END PGP SIGNATURE-----

--Signature=_Tue__13_Sep_2011_12_07_16_+1000_WNpWN_ZmRZq5vp5W--
