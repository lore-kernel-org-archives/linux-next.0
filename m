From: Christoph Hellwig <hch@lst.de>
Subject: Re: randconfig build error with next-20151002, in samples/configfs
Date: Fri, 2 Oct 2015 16:59:15 +0200
Message-ID: <20151002145915.GA17469@lst.de>
References: <CA+r1Zhg6xNf6+vNBbQ62fdpHfbxY3z_Gzm1_3LKEtp+FXpH6qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+r1Zhg6xNf6+vNBbQ62fdpHfbxY3z_Gzm1_3LKEtp+FXpH6qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 02, 2015 at 07:56:46AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,

Looks like the sample will need a Kconfig dependency.  I'll send out
an updated series which should this in addition to the review comments.
