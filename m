From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: unusual update of the security tree
Date: Tue, 27 Nov 2012 15:45:17 -0800
Message-ID: <50B5508D.7050409@schaufler-ca.com>
References: <20121128101635.d5e864dffc4252ef9d5e1664@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121128101635.d5e864dffc4252ef9d5e1664@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
List-Id: linux-next.vger.kernel.org

On 11/27/2012 3:16 PM, Stephen Rothwell wrote:

> Hi James,
>
> The security tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git#next)
> looks a bit strange today ... It appears to have been created by Casey
> Schaufler (cc'd) and contains some quite old commits and back merges of
> your tree.  I *guess* you have merged in Casey's tree after he merged in
> your tree from yesterday.

I *thought* that I had used the same procedures that worked before.
In fact, I still do think that, but if it's a problem I can purge my
smack-next tree and start over.

James, the two changes that came from smack-next are pretty minor. I
don't think you should hesitate to back them out if that helps.


>
> Just for your consideration.
>
