From: Minchan Kim <minchan@kernel.org>
Subject: Re: mmotm 2016-05-19-19-59 uploaded
Date: Fri, 20 May 2016 14:14:17 +0900
Message-ID: <20160520051417.GA6808@bbox>
References: <573e7da6.pLi6U/36fnX6Drn0%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <573e7da6.pLi6U/36fnX6Drn0%akpm@linux-foundation.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, May 19, 2016 at 07:59:50PM -0700, akpm@linux-foundation.org wro=
te:
> The mm-of-the-moment snapshot 2016-05-19-19-59 has been uploaded to
>=20
>    http://www.ozlabs.org/~akpm/mmotm/
>=20
> mmotm-readme.txt says
>=20
> README for mm-of-the-moment:
>=20
> http://www.ozlabs.org/~akpm/mmotm/
>=20
> This is a snapshot of my -mm patch queue.  Uploaded at random hopeful=
ly
> more than once a week.
>=20
> You will need quilt to apply these patches to the latest Linus releas=
e (4.x
> or 4.x-rcY).  The series file is in broken-out.tar.gz and is duplicat=
ed in
> http://ozlabs.org/~akpm/mmotm/series
>=20
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-=
ss,
> followed by the base kernel version against which this patch series i=
s to
> be applied.
>=20
> This tree is partially included in linux-next.  To see which patches =
are
> included in linux-next, consult the `series' file.  Only the patches
> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included=
 in
> linux-next.
>=20
> A git tree which contains the memory management portion of this tree =
is
> maintained at git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm=
=2Egit
> by Michal Hocko.  It contains the patches which are between the
> "#NEXT_PATCHES_START mm" and "#NEXT_PATCHES_END" markers, from the se=
ries
> file, http://www.ozlabs.org/~akpm/mmotm/series.
>=20
>=20
> A full copy of the full kernel tree with the linux-next and mmotm pat=
ches
> already applied is available through git within an hour of the mmotm
> release.  Individual mmotm releases are tagged.  The master branch al=
ways
> points to the latest release, so it's constantly rebasing.
>=20
> http://git.cmpxchg.org/cgit.cgi/linux-mmotm.git/
>=20
> To develop on top of mmotm git:
>=20
>   $ git remote add mmotm git://git.kernel.org/pub/scm/linux/kernel/gi=
t/mhocko/mm.git
>   $ git remote update mmotm
>   $ git checkout -b topic mmotm/master
>   <make changes, commit>
>   $ git send-email mmotm/master.. [...]
>=20
> To rebase a branch with older patches to a new mmotm release:
>=20
>   $ git remote update mmotm
>   $ git rebase --onto mmotm/master <topic base> topic
>=20
>=20
>=20
>=20
> The directory http://www.ozlabs.org/~akpm/mmots/ (mm-of-the-second)
> contains daily snapshots of the -mm tree.  It is updated more frequen=
tly
> than mmotm, and is untested.
>=20
> A git copy of this tree is available at
>=20
> 	http://git.cmpxchg.org/cgit.cgi/linux-mmots.git/
>=20
> and use of this tree is similar to
> http://git.cmpxchg.org/cgit.cgi/linux-mmotm.git/, described above.
>=20

In first build, I got this.

In file included from mm/filemap.c:14:0:
include/linux/dax.h:14:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:16:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:39:5: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
     dax_iodone_t di)
     ^
In file included from mm/vmscan.c:49:0:
include/linux/dax.h:14:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:16:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:39:5: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
     dax_iodone_t di)
     ^
In file included from mm/truncate.c:12:0:
include/linux/dax.h:14:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:16:3: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
   dax_iodone_t);
   ^
include/linux/dax.h:39:5: error: unknown type name =E2=80=98dax_iodone_=
t=E2=80=99
     dax_iodone_t di)
     ^
make[1]: *** [mm/truncate.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [mm/filemap.o] Error 1
make[1]: *** [mm/vmscan.o] Error 1
make: *** [mm/] Error 2

--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
