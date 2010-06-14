From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: linux-next: manual merge of the drbd tree with the
	block trees
Date: Mon, 14 Jun 2010 11:26:39 +1000
Message-ID: <20100614112639.ef45a777.sfr@canb.auug.org.au>
References: <20100610135203.4649453a.sfr@canb.auug.org.au>
	<4C107FBF.9050209@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7146904712283891052=="
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
In-Reply-To: <4C107FBF.9050209-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
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
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
List-Id: linux-next.vger.kernel.org

--===============7146904712283891052==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__14_Jun_2010_11_26_39_+1000_oL/Hwo6W0EN0Jg5q"

--Signature=_Mon__14_Jun_2010_11_26_39_+1000_oL/Hwo6W0EN0Jg5q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens, Philipp,

On Thu, 10 Jun 2010 08:01:35 +0200 Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org> wrote:
>
> I'm starting to think that it would be a little easier if you did not
> pull the drbd tree, I really should be pulling that into my -next branch
> instead.

Given that the drbd tree has not been updated to match the increasingly
different block tree, I have dropped it for today.

There a a few possibilities here:
	- I just drop the drbd tree completely and it only gets merged
into the block tree.
	- if the drbd tree doesn't actually depend on any of the features
in the block tree then it could be rebased onto Linus tree (and I would
cope with any merge fixups - as I do with many other trees).
	- if it does depend on things in the block tree, those particular
features in the block tree could be put in a separate branch that is
never rebased and then that branch could be merged into both the block
and drbd trees (this has been done before e.g. stuff in the vfs tree.
	- the drbd tree could be rebased on tom of the current block tree
(but then it must be kept up to date if the block tree is rebased).

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__14_Jun_2010_11_26_39_+1000_oL/Hwo6W0EN0Jg5q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwVhU8ACgkQjjKRsyhoI8w7mACcC5IH+E4sX4sag6CLghdiHQuq
bXoAn3C91BgaFpPPAZYnyFR/7zvMXsAD
=OBWy
-----END PGP SIGNATURE-----

--Signature=_Mon__14_Jun_2010_11_26_39_+1000_oL/Hwo6W0EN0Jg5q--

--===============7146904712283891052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
http://lists.linbit.com/mailman/listinfo/drbd-dev

--===============7146904712283891052==--
