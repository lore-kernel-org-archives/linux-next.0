From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the bkl-trivial tree with the hfsplus tree
Date: Mon, 4 Oct 2010 10:29:44 +0200
Message-ID: <20101004082944.GA15480@lst.de>
References: <20101004104740.822b987d.sfr@canb.auug.org.au> <20101004033441.GA6867@lst.de> <201010041023.45694.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201010041023.45694.arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Oct 04, 2010 at 10:23:45AM +0200, Arnd Bergmann wrote:
> Christoph, are you planning to take care of freevxfs, too? I can't figure
> out whether readdir and lookup actually need locking there.

They shouldn't, but I'll take a look.
