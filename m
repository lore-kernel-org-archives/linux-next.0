From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Fri, 7 Mar 2014 11:02:47 -0600 (CST)
Message-ID: <alpine.DEB.2.10.1403071100470.21846@nuc>
References: <20140306192234.62ad3ac104a2adc16752b033@canb.auug.org.au>
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140306192234.62ad3ac104a2adc16752b033@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 6 Mar 2014, Stephen Rothwell wrote:

>
> I have reverted that commit for today.
>
> I suspect that this whole series may need more review and work.

Toss the bits that do not build for now. These can then be handled in
individual patches since the overall framework is present.
