Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DBD2F1FEF;
	Thu, 28 May 2026 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779957014; cv=none; b=ZpXrQDmZ9qNHiW0gyRHJFdE+WM2XaY0LkEcyEU17pDBmjRAHvpZotCoq0xIFykUJWf2yZwqzff3NQ7CfLtJJQJRlG4Vv1U/Zz7XQg+zYf+lrpb9iMFuMU37V6+ZQaaYIHJmpHE/tXppqTn8RRf6h1iJ+oNwJhiOnsWeDxKnRydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779957014; c=relaxed/simple;
	bh=JbdGvoem1i/pYxbWZNTqGm8BeehwwrHwsOPWkwoq3BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFmQeUemIEIA6+9N03gE2IXFyi3cPE0Gn7EZ0uqthlTTHW+CA1t7MNIDN/kusozkywX3r9DMxgk96b+G1Sy6SUaakgeFKnee8gnNlJrTNrrsvzUE6y4DhqLVB1AQ7kQyMy3BBuhInD9Zp8mNExRYfgKvVOM8IEKERXcaiFAGuZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmgIUIVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmgIUIVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1311F000E9;
	Thu, 28 May 2026 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957011;
	bh=pnD684ZDM8lQMbk/SW1TAYLA7kWUJbCHKY+wEC5FHac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cmgIUIVL3+xC4VkjZS7lWzwwYVMShV1iAlVvCLi9BZ4wFXq9sBnYeBpOsJCZf7z+/
	 DlqsbNyGpqSd+QFjk5zbTfruEMHKv5KOolfz632CRc+dwrlOCcK8jnZzRDV4A5quML
	 CMBEWJFcfX0cL24MT+M4SHWWE+ht9EHw8zeNsKPaAQQVLh+5j4ba6yqDx8S+NTeKbX
	 x+LYx9cKRAbgGHRdHDyX+kkwFV1LSO23/ktICHcj1P940ISFzhIPoQrtIvot+8nLav
	 3TmK1Jxnjv+HbaPSqyIG5kVC44Bsr+ZYCVY0akpcpnL/uE7TGaBVCQ0CiTaziL2yXp
	 dEXDQDOx/TWfw==
Date: Thu, 28 May 2026 10:30:07 +0200
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chuck Lever <chuck.lever@oracle.com>, 
	Miklos Szeredi <mszeredi@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nfsd tree
Message-ID: <20260528-schalldicht-krampf-gefesselt-1be0e54eaa10@brauner>
References: <ahRHShZFjI8AsT8G@sirena.org.uk>
 <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="53uwv4bsz3i44rlq"
Content-Disposition: inline
In-Reply-To: <894b9eb2-e054-40e4-a423-1ee5412a5e91@sirena.org.uk>


--53uwv4bsz3i44rlq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 25, 2026 at 02:08:44PM +0100, Mark Brown wrote:
> On Mon, May 25, 2026 at 01:57:46PM +0100, Mark Brown wrote:
> 
> > After merging the nfsd tree, today's linux-next build (arm64 allnoconfig)
> > failed like this:
> 
> > ld: Unexpected GOT/PLT entries detected!
> > ld: Unexpected run-time procedure linkages detected!
> 
> > I didn't figure out exactly which commit did this but I'm guessing it's
> > one of these from the vfs-brauner tree that you've pulled in:
> 
> >   1cd9d2387c05a (simple_xattr: change interface to pass struct simple_xattrs **)
> >   12e9e3cd03b5a (simpe_xattr: use per-sb cache)
> 
> > I have used the version from next-20260522 instead.
> 
> Unsurprisingly the vfs-brauner tree also acquired the same build failure
> so I also held it back at next-20260522.

@Miklos, I'm switching this back to jhash() otherwise we have to
default-select xxhash. See appended patch.

--53uwv4bsz3i44rlq
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment;
	filename="0001-fs-xattr-use-jhash-for-simple_xattr-hashing.patch"

From 9393223b7e9fec1a73ebb5b572f6843d29d86456 Mon Sep 17 00:00:00 2001
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 28 May 2026 10:23:26 +0200
Subject: [PATCH] fs/xattr: use jhash for simple_xattr hashing

After commit c81b88b8932b ("simpe_xattr: use per-sb cache") switched
sx_hashfn() from jhash() to xxh32(), arm64 allnoconfig fails to link:

  ld: fs/xattr.o: in function `simple_xattr_obj_hashfn':
  xattr.c:(.text+0x2f0): undefined reference to `xxh32'
  ld: fs/xattr.o: in function `simple_xattr_hashfn':
  xattr.c:(.text+0x340): undefined reference to `xxh32'
  ld: fs/xattr.o: in function `simple_xattr_get':
  xattr.c:(.text+0x2374): undefined reference to `xxh32'

xxh32() lives in lib/xxhash.c, which is only built when CONFIG_XXHASH
is selected.  fs/xattr.o is built unconditionally via fs/Makefile's
obj-y, so a caller from fs/xattr.c needs XXHASH wired in too.

The obvious fix is to add a hidden always-y config in fs/Kconfig that
selects XXHASH.  But that is the wrong fix for this code: xxh32()
does not actually buy simple_xattr anything over jhash() at these
key sizes.

xxh32's throughput advantage comes from a four-lane multiply-add main
loop that processes 16 bytes per iteration, designed for the
checksum- and compression-sized payloads xxhash was written for (lz4,
zstd, btrfs csum, ksm page dedup).  The fixed setup cost of priming
those four lanes only amortizes once the input is well past one
iteration.  The keys hashed in sx_hashfn() are tiny - 8 bytes for the
parent list_head pointer and ~10-30 bytes for typical xattr names
like "user.foo" or "security.evm" - exactly the size regime where
jhash equals or beats xxh32.  Both pass SMHasher and have equivalent
avalanche properties, so the rhashtable's collision rate is
unchanged.

Switch sx_hashfn() back to jhash().  It is header-inline, has the
same distribution quality on these inputs, matches the hash used by
the original rhashtable-based infrastructure in commit b32c4a213698
("xattr: add rhashtable-based simple_xattr infrastructure"), and
avoids dragging lib/xxhash.o into every kernel build for a two-call
hash composer that does not benefit from xxh32's bulk-hashing
strengths.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/all/ahRHShZFjI8AsT8G@sirena.org.uk
Fixes: c81b88b8932b ("simpe_xattr: use per-sb cache")
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/xattr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xattr.c b/fs/xattr.c
index 31cae48e11a4..4416033af881 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -23,7 +23,7 @@
 #include <linux/vmalloc.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/rhashtable.h>
-#include <linux/xxhash.h>
+#include <linux/jhash.h>
 
 #include <linux/uaccess.h>
 
@@ -1277,7 +1277,7 @@ struct simple_xattr *simple_xattr_alloc(const void *value, size_t size)
 
 static u32 sx_hashfn(const char *name, const struct list_head *parent, u32 seed)
 {
-	return xxh32(name, strlen(name), xxh32(&parent, sizeof(parent), seed));
+	return jhash(name, strlen(name), jhash(&parent, sizeof(parent), seed));
 }
 
 static u32 simple_xattr_hashfn(const void *data, u32 len, u32 seed)
-- 
2.47.3


--53uwv4bsz3i44rlq--
