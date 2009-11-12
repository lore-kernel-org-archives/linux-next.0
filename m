From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: sysctl tree build failure
Date: Thu, 12 Nov 2009 04:10:38 -0800
Message-ID: <m1skckaqpt.fsf@fess.ebiederm.org>
References: <20091112184805.1c0720cb.sfr@canb.auug.org.au>
	<m1ljicp3l0.fsf@fess.ebiederm.org>
	<20091112191451.d21250f2.sfr@canb.auug.org.au>
	<m1fx8kp0op.fsf@fess.ebiederm.org>
	<20091112214706.7c7b3168.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:58882 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753018AbZKLMKg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2009 07:10:36 -0500
In-Reply-To: <20091112214706.7c7b3168.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Thu\, 12 Nov 2009 21\:47\:06 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> On Thu, 12 Nov 2009 01:11:34 -0800 ebiederm@xmission.com (Eric W. Biederman) wrote:
>>
>> Any clue how all_noconfig happened to have CONFIG_SYSCTL_SYSCALL set?
>
> CONFIG_SYSCTL_SYSCALL defaults to y and only depends on
> CONFIG_PROC_SYSCTL which also defaults to y and depends on CONFIG_PROC_FS
> which also defaults to y.  All three are only selectable if
> CONFIG_EMBEDDED is y (which it obviously isn't).

Ah so.  An interesting twist of fate.  Thank you for satisfying my
curiosity.

Eric
