From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 net-next tree
Date: Mon, 13 Nov 2017 16:28:20 +1100
Message-ID: <20171113162810.28dd7f87@canb.auug.org.au>
References: <20171009175633.dm7hjmgoxusspue5@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009175633.dm7hjmgoxusspue5@sirena.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Amir Levy <amir.jer.levy@intel.com>, Michael Jamet <michael.jamet@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Mon, 9 Oct 2017 18:56:33 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> 
>   Documentation/admin-guide/thunderbolt.rst
> 
> between commit:
> 
>    e69b6c02b4c3b ("net: Add support for networking over Thunderbolt cable")
> 
> from the net-next tree and commit:
> 
>    ce6a90027c10f ("platform/x86: Add driver to force WMI Thunderbolt controller power status")
> 
> from the drivers-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc Documentation/admin-guide/thunderbolt.rst
> index 5c62d11d77e8,dadcd66ee12f..000000000000
> --- a/Documentation/admin-guide/thunderbolt.rst
> +++ b/Documentation/admin-guide/thunderbolt.rst
> @@@ -198,26 -198,17 +198,41 @@@ information is missing
>   To recover from this mode, one needs to flash a valid NVM image to the
>   host host controller in the same way it is done in the previous chapter.
>   
>  +Networking over Thunderbolt cable
>  +---------------------------------
>  +Thunderbolt technology allows software communication across two hosts
>  +connected by a Thunderbolt cable.
>  +
>  +It is possible to tunnel any kind of traffic over Thunderbolt link but
>  +currently we only support Apple ThunderboltIP protocol.
>  +
>  +If the other host is running Windows or macOS only thing you need to
>  +do is to connect Thunderbolt cable between the two hosts, the
>  +``thunderbolt-net`` is loaded automatically. If the other host is also
>  +Linux you should load ``thunderbolt-net`` manually on one host (it does
>  +not matter which one)::
>  +
>  +  # modprobe thunderbolt-net
>  +
>  +This triggers module load on the other host automatically. If the driver
>  +is built-in to the kernel image, there is no need to do anything.
>  +
>  +The driver will create one virtual ethernet interface per Thunderbolt
>  +port which are named like ``thunderbolt0`` and so on. From this point
>  +you can either use standard userspace tools like ``ifconfig`` to
>  +configure the interface or let your GUI to handle it automatically.
> ++
> + Forcing power
> + -------------
> + Many OEMs include a method that can be used to force the power of a
> + thunderbolt controller to an "On" state even if nothing is connected.
> + If supported by your machine this will be exposed by the WMI bus with
> + a sysfs attribute called "force_power".
> + 
> + For example the intel-wmi-thunderbolt driver exposes this attribute in:
> +   /sys/devices/platform/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/86CCFD48-205E-4A77-9C48-2021CBEDE341/force_power
> + 
> +   To force the power to on, write 1 to this attribute file.
> +   To disable force power, write 0 to this attribute file.
> + 
> + Note: it's currently not possible to query the force power state of a platform.

Just a reminder that this conflict still exists.

-- 
Cheers,
Stephen Rothwell
