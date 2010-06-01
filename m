From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: linux-next: manual merge of the drbd tree with
	Linus' tree
Date: Tue, 1 Jun 2010 18:22:13 +1000
Message-ID: <20100601182213.479a777e.sfr@canb.auug.org.au>
References: <20100601141324.edf41f7f.sfr@canb.auug.org.au>
	<20100601081823.GA29991@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9213388923251928700=="
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <20100601081823.GA29991-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============9213388923251928700==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__1_Jun_2010_18_22_13_+1000_4Uiwu0yNAo6fFDnA"

--Signature=_Tue__1_Jun_2010_18_22_13_+1000_4Uiwu0yNAo6fFDnA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Replacing Jens' Oracle address ...]

Hi Christoph,

On Tue, 1 Jun 2010 04:18:23 -0400 Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wro=
te:
>
> On Tue, Jun 01, 2010 at 02:13:24PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the drbd tree got a conflict in fs/pipe.c
> > between commit cc967be54710d97c05229b2e5ba2d00df84ddd64 ("fs: Add missi=
ng
> > mutex_unlock") from Linus' tree and commits
> > 0191f8697bbdfefcd36e7b8dc3eeddfe82893e4b ("pipe: F_SETPIPE_SZ should
> > return -EPERM for non-root") and b9598db3401282bb27b4aef77e3eee12015f7f=
29
> > ("pipe: make F_{GET,SET}PIPE_SZ deal with byte sizes") from the drbd tr=
ee.
> >=20
> > I fixed it up (see below) and can carry the fix for a while.
>=20
> Why is the drbd tree touching fs/pipe.c anyway?

It is based on the block tree.  I assume that it is currently based on a
version of the block tree that Jens has not yet pushed into
linux-next.  :-(

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__1_Jun_2010_18_22_13_+1000_4Uiwu0yNAo6fFDnA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwEwzUACgkQjjKRsyhoI8yR4QCgl/psxaQUgkFBNBPudbrU70K+
uB4AoILTi95f7AZPWIgKskt2yEknj1DT
=q5dZ
-----END PGP SIGNATURE-----

--Signature=_Tue__1_Jun_2010_18_22_13_+1000_4Uiwu0yNAo6fFDnA--

--===============9213388923251928700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============9213388923251928700==--
