From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the qcom tree
Date: Tue, 29 Jan 2019 22:07:26 +0100
Message-ID: <20190129210726.GA31708@kroah.com>
References: <20190129140846.4dc4c158@canb.auug.org.au>
 <9e32a49c-fb78-c5f8-77cf-66b4b4a8b4a2@linaro.org>
 <CAPBZ5QeLEHOLJDBW4zGXJ8DayvDU3V=rGJ6Ty-pKruZEYv88DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPBZ5QeLEHOLJDBW4zGXJ8DayvDU3V=rGJ6Ty-pKruZEYv88DQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Dai <daidavid1@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jan 29, 2019 at 02:30:08PM -0600, Andy Gross wrote:
> On Tue, 29 Jan 2019 at 05:46, Georgi Djakov <georgi.djakov@linaro.org> wrote:
> >
> > Hi Stephen,
> >
> > On 1/29/19 05:08, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Today's linux-next merge of the char-misc tree got a conflict in:
> > >
> > >   arch/arm64/boot/dts/qcom/sdm845.dtsi
> > >
> > > between commits:
> > >
> > >   05556681948b ("arm64: dts: sdm845: Add videocc node")
> > >   5b6f186f0abb ("arm64: dts: sdm845: Add rpmh powercontroller node")
> > >
> > > from the qcom tree and commit:
> > >
> > >   ae0037dbfc5e ("arm64: dts: sdm845: Add interconnect provider DT nodes")
> > >
> > > from the char-misc tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> 
> Greg,
> I'd prefer in this instance that this patch get dropped from
> char-misc.  I have too much stuff in flight with some additional
> patches coming in to mess with this right now.  And we don't have
> clients rdy anyway for this so let's wait till next cycle on this one.

Now reverted.

thanks,

greg k-h
