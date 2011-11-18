From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the tty tree with the s5p tree
Date: Fri, 18 Nov 2011 08:19:09 -0800
Message-ID: <20111118161909.GB30462@kroah.com>
References: <20111118142259.f3e509297b2a0046bec6df88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111118142259.f3e509297b2a0046bec6df88@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Rong Wang <Rong.Wang@csr.com>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 18, 2011 at 02:22:59PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/serial/Kconfig between commit 30fba06ac9eb ("serial: samsung:
> merge probe() function from all SoC specific extensions") from the s5p tree
> and commit 161e773cbd0c ("UART: add CSR SiRFprimaII SoC on-chip uart
> drivers") from the tty tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks fine, thanks.

greg k-h
