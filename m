From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 6 Aug 2015 17:24:03 +1000
Message-ID: <20150806172403.6eac2407@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36391 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753794AbbHFHYG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Aug 2015 03:24:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
allyesconfig) failed like this:

lib/test_user_copy.c: In function 'test_user_copy_init':
lib/test_user_copy.c:111:2: error: implicit declaration of function 'csum_partial_copy_from_user' [-Werror=implicit-function-declaration]
  csum_partial_copy_from_user(usermem, kmem, PAGE_SIZE, 0, &err);
  ^

Caused by commit

  0b6e2917b6fc ("lib/test_user_copy.c: check user checksum functions")

It looks like PowerPC 64 bit has an implementation of
csum_and_copy_from_user() that does not use csum_partial_copy_from_user()
and so this latter does not exist.  You need to check for
_HAVE_ARCH_COPY_AND_CSUM_FROM_USER.

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
