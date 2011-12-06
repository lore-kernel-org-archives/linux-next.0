From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Dec 6 (x86, not SMP)
Date: Tue, 06 Dec 2011 12:44:39 -0800
Message-ID: <4EDE7EB7.7080507@xenotime.net>
References: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:36395 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752111Ab1LFTp0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2011 14:45:26 -0500
In-Reply-To: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>

On 12/05/2011 08:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20111205:


on x86, when CONFIG_SMP is not enabled:

arch/x86/kernel/cpu/common.c:1149:2: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
