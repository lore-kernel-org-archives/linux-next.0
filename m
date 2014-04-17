From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: manual merge of the userns tree with Linus' tree
Date: Thu, 17 Apr 2014 01:44:21 -0700
Message-ID: <874n1s73bu.fsf@x220.int.ebiederm.org>
References: <20140417150657.6d67e750081860b30f99715c@canb.auug.org.au>
	<20140417052500.GZ18016@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:40096 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbaDQIos (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Apr 2014 04:44:48 -0400
In-Reply-To: <20140417052500.GZ18016@ZenIV.linux.org.uk> (Al Viro's message of
	"Thu, 17 Apr 2014 06:25:00 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

Al Viro <viro@ZenIV.linux.org.uk> writes:

> On Thu, Apr 17, 2014 at 03:06:57PM +1000, Stephen Rothwell wrote:
>> Hi Eric,
>> 
>> Today's linux-next merge of the userns tree got a conflict in
>> fs/namespace.c between various commits from Linus' tree and various
>> commits from the userns tree.
>> 
>> I fixed it up (hopefully - see below) and can carry the fix as necessary
>> (no action is required).
>
> Various commits include this:
> commit 38129a13e6e71f666e0468e99fdd932a687b4d7e
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Thu Mar 20 21:10:51 2014 -0400
>
>     switch mnt_hash to hlist
>
> present in v3.14...  It's been there since before the merge window.

And the code that is in conflict is even older.  

I just figured out of an abundance of caution I would make certain the
code was out there for automatic and semi-automatic things to pound on
before I resent my pull request to Linus, now that I have fixed the
stack overflow issue you were complaining about.

I suspect something about fixing mntput caused Stephen to loose his
trivial resolution for this trivial conflict.

Eric
