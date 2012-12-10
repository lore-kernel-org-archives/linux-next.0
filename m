From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: linux-next: fetch failure the xilinx tree
Date: Mon, 10 Dec 2012 15:29:34 +0100
Message-ID: <50C5F1CE.30402@metafoo.de>
References: <20121209162442.15fbb8509569c193bfd88986@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121209162442.15fbb8509569c193bfd88986@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Linn <John.Linn@xilinx.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 12/09/2012 06:24 AM, Stephen Rothwell wrote:
> Hi John,
> 
> Attempting to fetch the xilinx tree produces this error (and has for some
> days, now):
> 
> fatal: The remote end hung up unexpectedly
> 

They renamed the repository from linux-2.6-xlnx to linux-xlnx. I stumbled
over it as well.

- Lars
