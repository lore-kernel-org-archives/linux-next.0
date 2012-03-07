From: Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix task_nommu build regression in linux-next
Date: Wed, 7 Mar 2012 09:01:15 +0530
Message-ID: <CAAHN_R1uTxVAKTTR53nMgGP=3_yXNYF_BSEcjzKv40fruRinnA@mail.gmail.com>
References: <1331045377.17099.2.camel@deneb.redhat.com>
	<1331064994-6693-1-git-send-email-siddhesh.poyarekar@gmail.com>
	<20120306123959.1921bcca.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:33729 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755880Ab2CGDbP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Mar 2012 22:31:15 -0500
In-Reply-To: <20120306123959.1921bcca.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Salter <msalter@redhat.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Oleg Nesterov <oleg@redhat.com>

On Wed, Mar 7, 2012 at 2:09 AM, Andrew Morton <akpm@linux-foundation.or=
g> wrote:
> On Wed, =A07 Mar 2012 01:46:33 +0530
> Siddhesh Poyarekar <siddhesh.poyarekar@gmail.com> wrote:
>
>> Commit b7b2a0afacada237005068294cb0ccc49d32889e resulted in a build
>> failure for nommu builds:
>
> Bare git commit IDs aren't very useful, because the ID of a patch can
> be different in different trees. =A0And in linux-next, the ID of a pa=
tch
> can change over time. =A0This is why we like to refer to commits usin=
g the
> formulation b7b2a0afacad ("procfs: mark thread stack correctly in
> proc/<pid>/maps").

Thanks, I'll keep this in mind.


--=20
Siddhesh Poyarekar
http://siddhesh.in
