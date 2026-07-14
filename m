Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8D3448D16;
	Tue, 14 Jul 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031950; cv=none; b=hl0wG93ANoBwUPtBhun7H85RYIsqwLWQhyTuLKJs50FkM9IgjDCxGxvFfuKxlFa5BwRfVNJ/7eh6BR1kKh/9BS7TXCnRKNr3Ykzz3I9H0lqZXeMTVr4UVRTZjZffSPtkPFw/bWJNBHSya8mSOpkY5YsrDgP1obu3syjXD2C684g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031950; c=relaxed/simple;
	bh=zdwxn1OgC68gPyyXu82EKLBXD7w00hnR8CogNUE/TlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQJSbF5Xv7s8BZ22lcRd3aGkYFMbcG3CJRuzw0IyU1oa5jeDIEhyRTIchhjpPPoBCPT0zrMPdoh082wXOQHPEK993jv/xuKrveT9oviS/hInDVrYs4v1V+NFIY9YtWx817vkk03DZMKhQLtHVNwQnI2d9F7HW5KqMzlXelnz268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0Csi+pS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0Csi+pS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866F11F00A3F;
	Tue, 14 Jul 2026 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784031933;
	bh=p3O2g8rNPiKCTu9f6lO6PguzXO0QGJLLc5o+kf/J1ac=;
	h=Date:From:To:Cc:Subject;
	b=d0Csi+pSUOuVjqsRY77dvDfJdLpjDmpyrg5keD0e+x5zerNz+KmD83BZ62BfZFk7n
	 paLk3m1fWvnAX+FjClaJTcZlHn/YUDON1PJqblPGgOyYOFtjoExtKzVBh7eX/tga/t
	 ZXTup6OXl4w9Ig6Ul2ZJaQ2k8YYOW5w8jrq2/QyIYAnn4ZyPvuxfan9MZ3ymwZJfX5
	 fGvhx9QcFc1TIbfCnWqhEyRiwDPqMP4sR1+AJNmo1y7yhGJljBPWHHLeIJB9MkacLQ
	 7P+V1yNZhYcUIkTzeOkYsRUcqCZZgvmpMFh9XUpHaLsxRYYWfKB/6BqF/F4d/14UD0
	 //3M+hOwtJwbA==
Date: Tue, 14 Jul 2026 13:25:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: linux-next: manual merge of the jc_docs tree with the mm-unstable
 tree
Message-ID: <alYquUnNKl6FPKfJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cN4kvZv3zm10DpEB"
Content-Disposition: inline


--cN4kvZv3zm10DpEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/mm/hmm.rst

between commit:

  d68817e9c3198 ("mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap l=
ock-drop support")

=66rom the mm-unstable tree and commit:

  e834ee8e571d5 ("docs/mm: Fix braces")

=66rom the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined Documentation/mm/hmm.rst
index 4e5a750748ae5,54c461e7a143f..0000000000000
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@@ -156,57 -156,42 +156,57 @@@ During the ops->invalidate() callback t
  update action to the range (mark range read only, or fully unmap, etc.). =
The
  device must complete the update before the driver callback returns.
 =20
 -When the device driver wants to populate a range of virtual addresses, it=
 can
 -use::
 +When the device driver wants to populate a range of virtual addresses, the
 +normal interface is::
 =20
 -  int hmm_range_fault(struct hmm_range *range);
 +  int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
 +                                       unsigned long timeout);
 =20
  It will trigger a page fault on missing or read-only entries if write acc=
ess is
  requested (see below). Page faults use the generic mm page fault code pat=
h just
 -like a CPU page fault. The usage pattern is::
 +like a CPU page fault.
 +
 +The caller must not hold ``mmap_read_lock`` before the call.
 +``hmm_range_fault_unlocked_timeout()`` takes the mmap read lock internall=
y and
 +allows ``handle_mm_fault()`` to drop it during fault handling. This is re=
quired
 +for VMAs whose fault handlers may release the mmap lock, for example regi=
ons
 +managed by ``userfaultfd``.
 +
 +If the mmap lock is dropped or the range is invalidated, the function ref=
reshes
 +``range->notifier_seq`` and restarts the walk internally. ``-EINTR`` is r=
eturned
 +if mmap lock acquisition is interrupted or a fatal signal is pending duri=
ng
 +retry handling.
 +
 +The timeout is specified in jiffies; passing ``0`` means retry indefinite=
ly. The
 +timeout exists to preserve caller policy for repeated mmu-notifier invali=
dation
 +and is checked between retry attempts. HMM does not interrupt page fault
 +handling when the timeout expires, but returns ``-EBUSY`` if the retry bu=
dget is
 +exhausted before a stable range is obtained.
 +
 +The usage pattern is::
 =20
   int driver_populate_range(...)
   {
        struct hmm_range range;
 +      unsigned long timeout;
        ...
 =20
 +      timeout =3D msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
        range.notifier =3D &interval_sub;
        range.start =3D ...;
        range.end =3D ...;
        range.hmm_pfns =3D ...;
 =20
 -      if (!mmget_not_zero(interval_sub->notifier.mm))
 +      if (!mmget_not_zero(interval_sub.mm))
            return -EFAULT;
 =20
   again:
 -      range.notifier_seq =3D mmu_interval_read_begin(&interval_sub);
 -      mmap_read_lock(mm);
 -      ret =3D hmm_range_fault(&range);
 -      if (ret) {
 -          mmap_read_unlock(mm);
 -          if (ret =3D=3D -EBUSY)
 -                 goto again;
 -          return ret;
 -      }
 -      mmap_read_unlock(mm);
 +      ret =3D hmm_range_fault_unlocked_timeout(&range, timeout);
 +      if (ret)
 +          goto out_put;
 =20
        take_lock(driver->update);
 -      if (mmu_interval_read_retry(&ni, range.notifier_seq)) {
 +      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
            release_lock(driver->update);
            goto again;
        }
@@@ -215,11 -200,7 +215,11 @@@
         * under the update lock */
 =20
        release_lock(driver->update);
 -      return 0;
 +      ret =3D 0;
 +
 + out_put:
 +      mmput(interval_sub.mm);
 +      return ret;
   }
 =20
  The driver->update lock is the same lock that the driver takes inside its
@@@ -227,19 -208,6 +227,19 @@@ invalidate() callback. That lock must b
  mmu_interval_read_retry() to avoid any race with a concurrent CPU page ta=
ble
  update.
 =20
 +Holding the mmap lock across HMM faults
 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 +
 +Most callers should use ``hmm_range_fault_unlocked_timeout()``. If a driv=
er
 +really needs to hold the mmap lock across work outside HMM, it can use::
 +
 +  int hmm_range_fault(struct hmm_range *range);
 +
 +The mmap lock must be held by the caller and will remain held on return. =
This
 +interface cannot support VMAs whose fault handlers need to drop the mmap =
lock.
 +New callers should prefer ``hmm_range_fault_unlocked_timeout()`` unless t=
hey
 +have a specific requirement to keep the mmap lock held across the call.
 +
  Leverage default_flags and pfn_flags_mask
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
@@@ -253,8 -221,8 +253,8 @@@ permission, it sets:
      range->default_flags =3D HMM_PFN_REQ_FAULT;
      range->pfn_flags_mask =3D 0;
 =20
 -and calls hmm_range_fault() as described above. This will fill fault all =
pages
 -in the range with at least read permission.
 +and calls the HMM range fault helper as described above. This will fault
 +all pages in the range with at least read permission.
 =20
  Now let's say the driver wants to do the same except for one page in the =
range for
  which it wants to have write permission. Now driver set::
@@@ -268,9 -236,9 +268,9 @@@ address =3D=3D range->start + (index_of_wri
  write permission i.e., if the CPU pte does not have write permission set =
then HMM
  will call handle_mm_fault().
 =20
 -After hmm_range_fault completes the flag bits are set to the current stat=
e of
 -the page tables, ie HMM_PFN_VALID | HMM_PFN_WRITE will be set if the page=
 is
 -writable.
 +After the HMM range fault helper completes the flag bits are set to the
 +current state of the page tables, ie HMM_PFN_VALID | HMM_PFN_WRITE will be
 +set if the page is writable.
 =20
 =20
  Represent and manage device memory from core kernel point of view
@@@ -348,7 -316,7 +348,7 @@@ between device driver specific code an
     system memory and device private memory.
 =20
     One of the first steps migrate_vma_setup() does is to invalidate other
-    device's MMUs with the ``mmu_notifier_invalidate_range_start(()`` and
+    device's MMUs with the ``mmu_notifier_invalidate_range_start()`` and
     ``mmu_notifier_invalidate_range_end()`` calls around the page table
     walks to fill in the ``args->src`` array with PFNs to be migrated.
     The ``invalidate_range_start()`` callback is passed a

--cN4kvZv3zm10DpEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWKrgACgkQJNaLcl1U
h9AK5wf/TeewFx2NXP+G5vmuIcuZQKtvkYzFfkI35tUm7w0y9D1B4yOC5CuSeBOM
Lwi4YV9RN+mvrdynIzcqpQBsOh7lA/NGiovgMl9lkDIj5K7zrQdcgAXvgUOblCcV
+4Mv8PvOwqJEHrOataJur0z1TSpwY2ZrPkTVQWgl1WuuJd161Sm6fLxek54z/Wfg
/fd28TN+LWTNLbFYePaewjCpFyPB05lUJL3rtP/kWZwWAyG6vZyJkI5g2ShZRuQP
cIEzraOVwvPMVNI3iPeMVQpG4cYrPfP80RLnNtSsJo/5Qbqf6KvwO5hnPoAT5IgO
0e0mToWH+wlInVe9rRB/Ei9oU/fW2A==
=n47G
-----END PGP SIGNATURE-----

--cN4kvZv3zm10DpEB--
