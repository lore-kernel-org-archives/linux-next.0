From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the jc_docs tree
Date: Wed, 09 Nov 2016 14:16:32 -0500
Message-ID: <1478718992.31015.3.camel@linux.vnet.ibm.com>
References: <20161109151915.16d93e4b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161109151915.16d93e4b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, 2016-11-09 at 15:19 +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   Documentation/admin-guide/kernel-parameters.rst
> 
> between commit:
> 
>   e52347bd66f6 ("Documentation/admin-guide: split the kernel parameter list to a separate file")
> 
> from the jc_docs tree and patch:
> 
>   "ima: define a canonical binary_runtime_measurements list format"
> 
> from the akpm tree.
> 
> I fixed it up (I moved the change to
> Documentation/admin-guide/kernel-parameters.txt) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thank you for fixing and carrying the change.

Mimi
