From: James Morris <james.l.morris@oracle.com>
Subject: Re: linux-next: the selinux tree needs cleaning up
Date: Fri, 27 Jun 2014 12:41:21 +1000
Message-ID: <53ACD9D1.2010803@oracle.com>
References: <20140618084046.1bce12cc@canb.auug.org.au> <20140620085931.6427678d@canb.auug.org.au> <1474416.aEfMv8Ny53@sifl> <32647147.KmAPzBrbMT@sifl> <20140625095928.3161ebe1@canb.auug.org.au> <53AAA9BF.4090205@oracle.com> <20140626081232.52cb51da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [141.146.126.69] ([141.146.126.69]:50681 "EHLO
	aserp1040.oracle.com" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1751406AbaF0CmB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jun 2014 22:42:01 -0400
In-Reply-To: <20140626081232.52cb51da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>

On 06/26/2014 08:12 AM, Stephen Rothwell wrote:
> Hi James,
>
> On Wed, 25 Jun 2014 20:51:43 +1000 James Morris <james.l.morris@oracle.com> wrote:
>>
>> I haven't pulled in Paul's tree, I merged with the latest Linus release.
>
> Ummm, yesterday your security tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git#next)
> moved from commit 2fd4e6698f08 ("Merge branch 'smack-for-3.16' of
> git://git.gitorious.org/smack-next/kernel into next") (which is
> included in v3.16-rc1) to commit f01387d26938 ("Merge commit 'v3.15'
> into next").  The commit between those 2 commits is 92953ff38ba5
> ("Merge branch 'next' of git://git.infradead.org/users/pcmoore/selinux
> into next").
>

Ok, I thought you meant pulled in more recently.
