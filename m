From: Tejun Heo <tj@kernel.org>
Subject: Re: [-next July 21] s390 build failure : kernel/workqueue.o
Date: Wed, 21 Jul 2010 17:57:09 +0200
Message-ID: <4C4718D5.1080902@kernel.org>
References: <4C46CEA3.7040503@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:54917 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758230Ab0GUP5S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jul 2010 11:57:18 -0400
In-Reply-To: <4C46CEA3.7040503@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

Hello,

On 07/21/2010 12:40 PM, Sachin Sant wrote:
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

Hmmm... that's surprising.  Can you please attach the .config?

Thanks.

-- 
tejun
