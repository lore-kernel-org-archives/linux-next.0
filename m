From: John Johansen <john.johansen@canonical.com>
Subject: Re: linux-next: build failure after merge of the security-testing
 tree
Date: Fri, 30 Jul 2010 00:31:37 -0700
Message-ID: <4C527FD9.3060708@canonical.com>
References: <20100730120624.f3112742.sfr@canb.auug.org.au> <alpine.LRH.2.00.1007301353340.8846@tundra.namei.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:37733 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab0G3Hbl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 Jul 2010 03:31:41 -0400
In-Reply-To: <alpine.LRH.2.00.1007301353340.8846@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/29/2010 08:54 PM, James Morris wrote:
> On Fri, 30 Jul 2010, Stephen Rothwell wrote:
> 
>> Hi James,
>>
>> After merging the security-testing tree, today's linux-next build
>> (powerpc ppc64_defconfig) failed like this:
>>
>> security/Kconfig:144: can't open file "security/apparmor/Kconfig"
>>
>> Caused by commit 32bd8e5273c0be4189274ab55c4d16862f0dd87d ("AppArmor:
>> Enable configuring and building of the AppArmor security module").  Looks
>> like a file was missed.
> 
> I don't know how to use git.
> 
> Should be fixed now.
> 
works for me,

thanks James
