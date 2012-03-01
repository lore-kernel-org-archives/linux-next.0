From: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Subject: Re: build failure in linux-next
Date: Thu, 1 Mar 2012 22:32:43 +0530
Message-ID: <CAAHN_R1br+QU+DhZ5rxOjjovTtjsgEAn4Yz1wE3-J9Djd-DxFw@mail.gmail.com>
References: <1330618302.2453.7.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:34229 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756944Ab2CARCn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Mar 2012 12:02:43 -0500
In-Reply-To: <1330618302.2453.7.camel@deneb.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Mar 1, 2012 at 9:41 PM, Mark Salter <msalter@redhat.com> wrote:
> In linux-next, this breaks nommu builds:
>
> commit b8665bd461ecdc561e7c95d039567d0a79208226
> Author: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
> Date: =A0 Sat Feb 25 12:28:09 2012 +1100
>
> =A0 =A0procfs: mark thread stack correctly in proc/<pid>/maps
>
> I think this was merged into linux-next from the -mm tree.
>
> There are unbalanced parens in fs/proc/task_nommu.c which leads to th=
is
> when building:
>
> fs/proc/task_nommu.c: In function 'nommu_vma_show':
> fs/proc/task_nommu.c:177:2: warning: no return statement in function =
returning non-void
> fs/proc/task_nommu.c: At top level:
> fs/proc/task_nommu.c:179:14: error: expected ')' before '\xa'
> fs/proc/task_nommu.c:180:2: error: expected identifier or '(' before =
'return'
> fs/proc/task_nommu.c:181:1: error: expected identifier or '(' before =
'}' token
>

Sorry about that. My latest patch submission to procfs happens to fix t=
his:

https://lkml.org/lkml/2012/3/1/4

Do you need a separate submission that fixes just this build failure?


--=20
Siddhesh Poyarekar
http://siddhesh.in
