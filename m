From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: linux-next: build warnings (buffer size is not provably
 correct)
Date: Thu, 8 Oct 2009 06:42:21 -0700
Message-ID: <20091008064221.0453925a@infradead.org>
References: <20091008154710.a351a56b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:45265 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757971AbZJHNmq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2009 09:42:46 -0400
In-Reply-To: <20091008154710.a351a56b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, Wim Van Sebroeck <wim@iguana.be>, Al Viro <viro@zeniv.linux.org.uk>, akpm@linuxfoundation.org

On Thu, 8 Oct 2009 15:47:10 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (i386 defconfig) produced these warnings:
> 
> In file included from arch/x86/include/asm/uaccess.h:572,
>                  from kernel/capability.c:18:
> arch/x86/include/asm/uaccess_32.h: In function 'sys_capset':

the following needs to go somewhere... Andrew ?

From: Arjan van de Ven <arjan@linux.intel.com>
Subject: [PATCH 7/9] Simplify bound checks in capabilities for copy_from_user
CC: James Morris <jmorris@namei.org>

The capabilities syscall has a copy_from_user() call where gcc currently
cannot prove to itself that the copy is always within bounds.

This patch adds a very explicity bound check to prove to gcc that 
this copy_from_user cannot overflow its destination buffer.

Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
Acked-by: James Morris <jmorris@namei.org>

diff --git a/kernel/capability.c b/kernel/capability.c
index 4e17041..204f11f 100644
--- a/kernel/capability.c
+++ b/kernel/capability.c
@@ -238,7 +241,7 @@ SYSCALL_DEFINE2(capget, cap_user_header_t, header, cap_user_data_t, dataptr)
 SYSCALL_DEFINE2(capset, cap_user_header_t, header, const cap_user_data_t, data)
 {
 	struct __user_cap_data_struct kdata[_KERNEL_CAPABILITY_U32S];
-	unsigned i, tocopy;
+	unsigned i, tocopy, copybytes;
 	kernel_cap_t inheritable, permitted, effective;
 	struct cred *new;
 	int ret;
@@ -255,8 +258,11 @@ SYSCALL_DEFINE2(capset, cap_user_header_t, header, const cap_user_data_t, data)
 	if (pid != 0 && pid != task_pid_vnr(current))
 		return -EPERM;
 
-	if (copy_from_user(&kdata, data,
-			   tocopy * sizeof(struct __user_cap_data_struct)))
+	copybytes = tocopy * sizeof(struct __user_cap_data_struct);
+	if (copybytes > sizeof(kdata))
+		return -EFAULT;
+
+	if (copy_from_user(&kdata, data, copybytes))
 		return -EFAULT;
 
 	for (i = 0; i < tocopy; i++) {


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
