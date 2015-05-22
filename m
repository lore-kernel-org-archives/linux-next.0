From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 22 May 2015 13:27:21 +1000
Message-ID: <20150522132721.43c296cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jCreaIEx2PQh2kVx+k/BC6o"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36973 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754067AbbEVD13 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2015 23:27:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/jCreaIEx2PQh2kVx+k/BC6o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

block/bio.c:310:20: error: redefinition of 'bio_inc_remaining'
 static inline void bio_inc_remaining(struct bio *bio)
                    ^
In file included from block/bio.c:20:0:
include/linux/bio.h:664:20: note: previous definition of 'bio_inc_remaining=
' was here
 static inline void bio_inc_remaining(struct bio *bio)
                    ^

Caused by commit d61b82161c5a ("block: remove management of
bi_remaining when restoring original bi_end_io").

OK, this is a bad automatic merge caused by the fact that the block
tree and the device-mapper tree both contain the same set fo patches as
different commits.

Commit c4cf5261f8bf from the block tree is the same as commit
8395711c4f90 from the device-mapper tree and both add
bio_inc_remaining() to include/linux/bio.h.  The above commit in the
device-mapper tree removes it from there, but the merge decided to keep
it.

That shared patch above is part of a series of 14 patches that are
identical patches but different commits and are causing quite a few
conflicts.  It looks like those patches were rebased onto v4.10rc3 as
the base for the device-mapper tree.  A better idea would have been to
start with v4.1rc3 (if that is necessary) and merge commit 5b3f341f098d
("blk-mq: make plug work for mutiple disks and queues") from the block
tree - assuming that Jens will guarantee not to rebase that part of his
tree.

Please clean this mess up.

I have used the version of the device-mapper tree from next-20150521
for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/jCreaIEx2PQh2kVx+k/BC6o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXqIeAAoJEMDTa8Ir7ZwV1oIP/AsJtzsG/Wz37m4qvDt9T+Ol
KrTBLjABlSclEgCxOhFJiKxcDIZ/16fKc7f09hsNuQzSeh3L7HMurb/Oswv9BUX7
lIBYJe4s1MtJVIYqMu22lPbLPnUBp8G5+tlaVvv5ovc6UGja5hDvAKjcnL/w5cAa
JX9ljBquoBRjTER0sLg0U8ep9njixS+I0S7YNhMPLKDbjpA4JXRLQoUUoR3qUKYS
l78CmS6M/ozbI6OFrsy0BJilgjuOqKOeUt9NZU7du8YfrpYiBe0P05BHCHmOoWyG
o0LloNPh6VxYgRosbFSHoN6BZwuz9gobbVUulbRFc2eFNR785Ii414/Vm8ELKzYY
vw0ihTIPDVD7OHxg2/9VQWc9zS75E5QQmjcYTJ91ovrkk0ELyruiWjx93/3IHd/M
9ooYYXRFXvu5V9mmZQWXJEBG0DyYKWwVbO4f/P+nKTqJid4Q8X3MeG+h/2+delCQ
Oc4nug37VI0wYbz5zP28wucivcuCQmQieQdHRdwUiaQuQX1h6OXcRgTycf3RefbI
62k53q3dm/8a8IriIfiD+OP38TpBXvFNUzNCm9HXwSbF7watMcOSbD68rUhOhvUb
OQw9DRtyDNBD2X+LefvwBZOkCND1SGRN+1YxyWNiIuDotFSSdlN3nLznUW9iQyl7
YjhiNKkxDm5S54lM5YYM
=MC7a
-----END PGP SIGNATURE-----

--Sig_/jCreaIEx2PQh2kVx+k/BC6o--
