From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Tue, 3 Jan 2012 08:21:08 -0800
Message-ID: <20120103162108.GC25909@kroah.com>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 28, 2011 at 05:45:18PM +1100, Stephen Rothwell wrote:
> Because of the powerpc problems above, I have used the driver-core tree
> from next-20111222 for today.

Sorry about all of the problems, we tried to fix everything we could,
but your merges and cross-builds found stuff we missed :(

Kay, care to send me patches to fix this, and all of the other
linux-next-reported problems to me so we can get this resolved this
week?

thanks,

greg k-h
