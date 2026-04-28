Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34C3E557D;
	Tue, 28 Apr 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371777; cv=none; b=Rom/rkPoGykUkTZ3xevofiKpmIQrgPTGzFAMufipxdcg8Sxe9gSngrGDfmlVzcB+jimDsYlrubaT2uMVWq23Uag0EMnGsB+PUoigGW36Vi/tyLaFscvC1Q38jngwqHsx4M/SOQ5t7U/RSfWNI8/wvl0NLIb9kBOVbyTOucfX4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371777; c=relaxed/simple;
	bh=cIl7A5mgBdu22p8RyRHkMEdf0Bvbfve4dBjJ+3yZtII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOwymxt7duVfFkztxUnw3Cv46IM+BEidNYQ2eMXclomFXEs/lAy0/r+1TkqRV+AAx2dRUxub/qSzzAZEEr6CyFZp6Le3gFJKxusn7AKHvlsNKO0+tSVC8/xkDjPpUaZqZGcnRlUaIDoZ251n5xar1EUrgjOeKhuiMusgyHKw/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRLEmZDs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRLEmZDs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C770FC2BCAF;
	Tue, 28 Apr 2026 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371777;
	bh=cIl7A5mgBdu22p8RyRHkMEdf0Bvbfve4dBjJ+3yZtII=;
	h=From:To:Cc:Subject:Date:From;
	b=jRLEmZDsH/jb0N+mbTOPbSA/00cQ1EchYsb6rCA3VHiy8aBlgqFOzxYPRHw5R5849
	 Yd19KeSxJ2pxHMvOVDPIv3bMj8w9RpbGU1NXv0gYnGz9eKSxAqz+4OX9XhpJoD5+l4
	 OwRObZBwYGSi5JoBuizIpLQgIfTpECNYMK4RTY+UHVSo7VMwuy049YtDXJFR1nErj7
	 oBfxidZXZ0eK4nVj3nPw4qQTLqHvgysJYmsobnAnGgz7imkm/hC9XI3T+IMi/QssSN
	 vX6I7ZyFUjXyYGABarUFBM0nbAiWYxQeXtvft68RSU+KJfwvYShR6ohno6/BomhEE5
	 QTFV4D+RidOOA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the efi-fixes tree
Date: Tue, 28 Apr 2026 12:22:49 +0200
Message-ID: <20260428102251.3877875-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After merging the efi-fixes tree, today's linux-next build (all of them)
failed like this:

    /srv/kbuild/next/linux.git/fs/efivarfs/super.c: In function 'efivarfs_d_hash':
    /srv/kbuild/next/linux.git/fs/efivarfs/super.c:183:20: error: assignment of member 'hash' in read-only object
      183 |         qstr->hash = end_name_hash(hash);
          |                    ^
    /srv/kbuild/next/linux.git/fs/efivarfs/super.c: At top level:
    /srv/kbuild/next/linux.git/fs/efivarfs/super.c:189:19: error: initialization of 'int (*)(const struct dentry *, struct qstr *)' from incompatible pointer type 'int (*)(const struct dentry *, const struct qstr *)' [-Wincompatible-pointer-types]
      189 |         .d_hash = efivarfs_d_hash,
          |                   ^~~~~~~~~~~~~~~
Caused by commit

    9c7c5eec5bca ("efivarfs: use QSTR() in efivarfs_alloc_dentry")

and like this:

    arm-linux-gnueabihf-ld: drivers/firmware/efi/libstub/relocate.stub.o: in function `efi_relocate_kernel':
    /srv/kbuild/next/linux.git/drivers/firmware/efi/libstub/relocate.c:161:(.text+0x278): undefined reference to `efi_cache_sync_image'
    arm-linux-gnueabihf-ld: arch/arm/boot/compressed/vmlinux: hidden symbol `efi_cache_sync_image' isn't defined
    arm-linux-gnueabihf-ld: final link failed: bad value

Caused by commit

    4db2b7fdd6c9 ("efi/libstub: Synchronize instruction cache after kernel relocation")

I've fixed up both issues with the following patches, please squash these
or equivalent changes into your tree to fix this.

Thanks,
Thierry

--- >8 ---
From a69b4ac52d86720885f49fb3a1d5a2311c652e17 Mon Sep 17 00:00:00 2001
From: Thierry Reding <treding@nvidia.com>
Date: Tue, 28 Apr 2026 11:53:12 +0200
Subject: [PATCH] efivarfs: Unconstify variable

The qstr structure is being written to in efivarfs_d_hash(), so it
cannot be made const.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 fs/efivarfs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
index 360d152e18af..733c19571f1c 100644
--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -167,7 +167,7 @@ static int efivarfs_d_compare(const struct dentry *dentry,
 	return strncasecmp(name->name + guid, str + guid, EFI_VARIABLE_GUID_LEN);
 }
 
-static int efivarfs_d_hash(const struct dentry *dentry, const struct qstr *qstr)
+static int efivarfs_d_hash(const struct dentry *dentry, struct qstr *qstr)
 {
 	unsigned long hash = init_name_hash(dentry);
 	const unsigned char *s = qstr->name;
@@ -191,7 +191,7 @@ static const struct dentry_operations efivarfs_d_ops = {
 
 static struct dentry *efivarfs_alloc_dentry(struct dentry *parent, char *name)
 {
-	const struct qstr q = QSTR(name);
+	struct qstr q = QSTR(name);
 	struct dentry *d;
 	int err;
 
-- 
2.52.0
--- >8 ---

--- >8 ---
From 1cd92fb251ee4fd59150863208a7d3660ec6b1cd Mon Sep 17 00:00:00 2001
From: Thierry Reding <treding@nvidia.com>
Date: Tue, 28 Apr 2026 12:05:30 +0200
Subject: [PATCH] efi/libstub: Make efi_cache_sync_image() always available

Currently this is only available when zboot is included. Make sure it's
always there to allow using it from other places in the EFI stub.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/efi/libstub/efi-stub.c | 7 +++++++
 drivers/firmware/efi/libstub/zboot.c    | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 42d6073bcd06..6d635dddfa36 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -48,6 +48,13 @@
 static u64 virtmap_base = EFI_RT_VIRTUAL_BASE;
 static bool flat_va_mapping = (EFI_RT_VIRTUAL_OFFSET != 0);
 
+void __weak efi_cache_sync_image(unsigned long image_base,
+				 unsigned long alloc_size)
+{
+	// Provided by the arch to perform the cache maintenance necessary for
+	// executable code loaded into memory to be safe for execution.
+}
+
 void __weak free_primary_display(struct sysfb_display_info *dpy)
 { }
 
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index 4b76f74c56da..d77c8059533f 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -19,13 +19,6 @@ static unsigned long alloc_preferred_address(unsigned long alloc_size)
 	return ULONG_MAX;
 }
 
-void __weak efi_cache_sync_image(unsigned long image_base,
-				 unsigned long alloc_size)
-{
-	// Provided by the arch to perform the cache maintenance necessary for
-	// executable code loaded into memory to be safe for execution.
-}
-
 struct sysfb_display_info *alloc_primary_display(void)
 {
 	return __alloc_primary_display();
-- 
2.52.0
--- >8 ---
