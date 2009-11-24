From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: linux-next: failed to fetch the mips tree
Date: Tue, 24 Nov 2009 00:09:29 +0000
Message-ID: <20091124000929.GA7223@linux-mips.org>
References: <20091124105303.512479aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757232AbZKXAJS@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20091124105303.512479aa.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

On Tue, Nov 24, 2009 at 10:53:03AM +1100, Stephen Rothwell wrote:

> git.linux-mips.org[0: 78.24.191.183]: errno=Connection refused
> fatal: unable to connect a socket (Connection refused)

Thanks.  I upgraded the machine from Fedora 10 to Fedora 12 and the
removal of the git "dash-commands" resulted in this failure.  Fixed.

> I will use the version from next-20091123 for today.

No problem; all changes can wait another day.

  Ralf
