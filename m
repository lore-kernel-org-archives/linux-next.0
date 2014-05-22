From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] perf: delete unused variable tmp to fix new build warning
Date: Thu, 22 May 2014 09:44:46 -0400
Message-ID: <537DFF4E.4070503@windriver.com>
References: <1400700787-11759-1-git-send-email-paul.gortmaker@windriver.com> <20140522122142.GA6650@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:51279 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932AbaEVNqC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 May 2014 09:46:02 -0400
In-Reply-To: <20140522122142.GA6650@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Paul Mackerras <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 14-05-22 08:21 AM, Ingo Molnar wrote:
>=20
> * Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>=20
>> commit 3a497f48637e2aac17eabb84a17f8ac5216028fc [tip:perf/core]
>> ("perf: Simplify perf_event_exit_task_context()") deleted the
>> code that was using tmp but not the declaration of it, causing:
>>
>> kernel/events/core.c:7434:35: warning: unused variable =E2=80=98tmp=E2=
=80=99 [-Wunused-variable]
>=20
> This warning should be addressed by:
>=20
>   12665b35b0b4 perf/events/core: Drop unused variable after cleanup

Indeed - and I now see that commit when I switch over to my tip repo.

However 12665b35b0b4 is not present in linux-next of yesterday or today
(21/22) for some reason.  The tip/auto-latest merged into next has this=
:

commit 1974363f7e899dc1b9e6e774dc885c7980a7159b
Merge: 67367e2c3f76 7fd44dacdd80
Author: Ingo Molnar <mingo@kernel.org>
Date:   Thu May 8 12:40:28 2014 +0200

    Merge branch 'x86/x32'

as its top commit.  Today's auto-latest in tip shows a similar merge, b=
ut
with today's date (and it contains Boris' warning fix too.)  Adding Ste=
phen
to CC in case it is something related to linux-next infrastructure.

Thanks,
Paul.
