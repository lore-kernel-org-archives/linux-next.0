From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: bad commits in the security tree
Date: Wed, 23 Nov 2016 04:09:07 +1100
Message-ID: <20161123040907.708bb4cc@canb.auug.org.au>
References: <20161122215810.60c0cb1f@canb.auug.org.au>
        <03bf91ac-1f20-1089-79dd-e342c9f610d9@schaufler-ca.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755406AbcKVRJf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 12:09:35 -0500
In-Reply-To: <03bf91ac-1f20-1089-79dd-e342c9f610d9@schaufler-ca.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Casey,

On Tue, 22 Nov 2016 08:17:24 -0800 Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 11/22/2016 2:58 AM, Stephen Rothwell wrote:
> > Hi James,
> >
> > I noticed that there are some commits in the security tree that have no
> > Signed-off-by from the committer (Casey Schaufler).
> >  
> My understanding is that patches I don't write should
> be Acked, not Signed-off when I commit them. If this is
> not correct I will address my misconduct.

If you are on the path of a patch to Linus, you need to sign off on the
patch according to the DCO - see section 11 of
Documentation/SubmittingPatches (or
Documentation/process/submitting-patches.rst where it has been moved
recently).

-- 
Cheers,
Stephen Rothwell
