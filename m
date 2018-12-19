From: Luca Coelho <luca-XPOmlcxoEMv1KXRcyAk9cg@public.gmane.org>
Subject: Re: linux-next: build warnings after merge of the
 wireless-drivers-next tree
Date: Wed, 19 Dec 2018 08:27:22 -0200
Message-ID: <1ce59aaf30aaa9f59fc84c68a9e83299df0d4af8.camel@coelho.fi>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
         <20181219134738.4efed34f@canb.auug.org.au>
         <871s6evtra.fsf@kamboji.qca.qualcomm.com>
         <0BA3FCBA62E2DC44AF3030971E174FB3013375F96C@HASMSX112.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0BA3FCBA62E2DC44AF3030971E174FB3013375F96C-cNwSTNrqBuVP9JyJpTNKArfspsVTdybXVpNB7YpNyf8@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Grumbach, Emmanuel" <emmanuel.grumbach-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Next Mailing List <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Sharon, Sara" <sara.sharon-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Gustavo A. R. Silva" <gustavo-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Networking <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2018-12-19 at 08:31 +0000, Grumbach, Emmanuel wrote:
> > Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> writes:
> > 
> > > On Fri, 30 Nov 2018 12:05:55 +1100 Stephen Rothwell
> > <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> wrote:
> > > > After merging the wireless-drivers-next tree, today's linux-next
> > > > build
> > > > (x86_64 allmodconfig) produced these warnings:
> > > > 
> > > > drivers/net/wireless/intel/iwlwifi/iwl-drv.c: In function
> > 'iwl_parse_tlv_firmware':
> > > > drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1098:7: warning: this
> > statement may fall through [-Wimplicit-fallthrough=]
> > > >     if (iwlwifi_mod_params.enable_ini)
> > > >        ^
> > > > drivers/net/wireless/intel/iwlwifi/iwl-drv.c:1100:3: note: here
> > > >    default:
> > > >    ^~~~~~~
> > > > drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: In function
> > 'iwl_parse_fw_dbg_tlv':
> > > > drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:203:4: warning: this
> > statement may fall through [-Wimplicit-fallthrough=]
> > > >     iwl_fw_dbg_copy_tlv(trans, tlv, true);
> > > >     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c:204:3: note: here
> > > >    default:
> > > >    ^~~~~~~
> > > > 
> > > > Introduced by commit
> > > > 
> > > >   f14cda6f3b31 ("iwlwifi: trans: parse and store debug ini TLVs")
> > > > 
> > > > These are noted because I use -Wimplict-fallthrough
> > > > 
> > > > The warnings can be suppressed by adding a comment like
> > > > 	/* fall through */
> > > > at the appropriate place to indicate that the fallthough is intended.
> > > 
> > > I am still seeing these warnings (but in the net-next tree now) and I
> > > do not see a fix patch in the wireless-drivers-next tree.
> > 
> > Luca did submit a patch[1] for cfg80211 to fix those but I don't see any
> > patches for iwlwifi (even in the one pending pull request he sent), not sure
> > what happened. I know that Luca is already on holidays but adding
> > Emmanuel, maybe he can help here?
> > 
> 
> Just sent a patch.

Those patches were still queued for upstreaming and I didn't think they
were that urgent, so I didn't pick them.

--
Luca.
