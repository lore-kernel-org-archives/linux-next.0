From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: Fix passing -Wno-* options to gcc 4.4+
Date: Tue, 03 May 2011 10:52:27 +0200
Message-ID: <4DBFC24B.7090805@suse.cz>
References: <20110502111337.GA15769@sepie.suse.cz>	<1304338381-3772-1-git-send-email-mmarek@suse.cz> <20110503104440.700ea26f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35127 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751406Ab1ECIwa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 May 2011 04:52:30 -0400
In-Reply-To: <20110503104440.700ea26f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: davej@redhat.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org

On 3.5.2011 02:44, Stephen Rothwell wrote:
> HI Michal,
>
> On Mon,  2 May 2011 14:13:01 +0200 Michal Marek<mmarek@suse.cz>  wrote:
>>
>> Starting with 4.4, gcc will happily accept -Wno-<anything>  in the
>> cc-option test and complain later when compiling a file that has some
>> other warning. This rather unexpected behavior is intentional as per
>> http://gcc.gnu.org/PR28322, so work around it by testing for support of
>> the opposite option (without the no-). Introduce a new Makefile function
>> cc-disable-warning that does this and update two uses of cc-option in
>> the toplevel Makefile.
>>
>> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
>> Signed-off-by: Michal Marek<mmarek@suse.cz>
>
> This fixed things for me, thanks.
>
> Tested-by: Stephen Rothwell<sfr@canb.auug.org.au>

Thanks for spotting the warnings and for testing. I pushed this to 
kbuild-2.6.git#kbuild.

Michal
