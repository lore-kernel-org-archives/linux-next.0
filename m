From: Michal Simek <michal.simek@petalogix.com>
Subject: Re: [-next July 21] s390 build failure : kernel/workqueue.o
Date: Thu, 22 Jul 2010 09:19:08 +0200
Message-ID: <4C47F0EC.5040507@petalogix.com>
References: <4C46CEA3.7040503@in.ibm.com>
Reply-To: michal.simek@petalogix.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:63463 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915Ab0GVHWb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jul 2010 03:22:31 -0400
In-Reply-To: <4C46CEA3.7040503@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Tejun Heo <tj@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

Sachin Sant wrote:
> Today's next fails to build on a s390 box with
> 
>  CC      kernel/workqueue.o
> kernel/workqueue.c: In function 'init_workqueues':
> kernel/workqueue.c:3525: error: negative width in bit-field '<anonymous>'
> make[1]: *** [kernel/workqueue.o] Error 1
> 
> Yesterday's next was good.
> The following patches added/changed the BUILD_BUG_ON() statement.
> 
> bdbc5dd7de5d07d6c9d3536e598956165a031d4c
>        workqueue: prepare for WQ_UNBOUND implementation
> 7a22ad757ec75186ad43a5b4670fa7423ee8f480
>         workqueue: carry cpu number in work data once execution starts
> 
> I have gcc version 4.3.2 installed on the system.

the same problem on microblaze gcc 4.1.2.

Thanks,
Michal



-- 
Michal Simek, Ing. (M.Eng)
PetaLogix - Linux Solutions for a Reconfigurable World
w: www.petalogix.com p: +61-7-30090663,+42-0-721842854 f: +61-7-30090663
