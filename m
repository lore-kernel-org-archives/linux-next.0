From: Johan Hedberg <johan.hedberg@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the net-next
 tree
Date: Mon, 2 Apr 2018 08:38:03 +0300
Message-ID: <20180402053803.GA17750@x1c.home>
References: <20180402123019.2e04f084@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180402123019.2e04f084@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Mon, Apr 02, 2018, Stephen Rothwell wrote:
>   45a42bc9cc65 ("Bluetooth: hci_bcm: Remove DMI quirk for the MINIX Z83-4")
>   f9b95db0165a ("Bluetooth: btrsi: remove unused including <linux/version.h>")
>   96e58d368fa6 ("Bluetooth: Set HCI_QUIRK_SIMULTANEOUS_DISCOVERY for BTUSB_QCA_ROME")
>   9ea471320e13 ("Bluetooth: Mark expected switch fall-throughs")
> 
> are missing a Signed-off-by from their committer.

I think this is because I fixed up a missing author name in "Bluetooth:
hci_bcm: Remove DMI quirk for the MINIX Z83-4" and did a push --force,
whereas these patches were originally committed by Marcel. Should I be
adding my signed-off-by to all affected patches when doing such rebases?

Johan
