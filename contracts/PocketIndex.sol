// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
import "./interfaces/IMoDexCoinRouter02.sol";
import "./interfaces/IIndexLP.sol";

contract Register {
    function register(address _recipient) public returns (uint256 tokenId) {}
}
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(
        uint256 a,
        uint256 b
    ) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(
        uint256 a,
        uint256 b
    ) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(
        uint256 a,
        uint256 b
    ) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(
        uint256 a,
        uint256 b
    ) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(
        uint256 a,
        uint256 b
    ) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}
interface IERC20Extended {
    function totalSupply() external view returns (uint256);

    function decimals() external view returns (uint8);

    function symbol() external view returns (string memory);

    function name() external view returns (string memory);

    function balanceOf(address account) external view returns (uint256);

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    function allowance(
        address _owner,
        address spender
    ) external view returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

/**
PocketIndex合约是一个加密货币指数投资工具。 
 */
contract PocketIndex {
    using SafeMath for uint256;

    address routerAddress;
    address public baseTokenAddress;
    IIndexLP public indexLPToken;
    address owner;
    IMoDexCoinRouter02 router;

    uint256 public lastBuyTime;
    uint256 public managementFee;
    uint256 public performanceFee;
    uint256 public totalBulkBuys;

    event NewAssetAdded(address contractAddress, uint256 timestamp);

    struct Asset {
        address contractAddress; // asset address
        uint256 balance; // current total balance
    }

    struct UserBalance {
        uint256 usdtBalance;
        mapping(address => uint256) balances;
    }

    mapping(address => UserBalance) userBalances;

    Asset[] assets;
    address[] nextBuyers;

    constructor(address _routerAddress, address _baseTokenAddress) {
        routerAddress = _routerAddress;
        baseTokenAddress = _baseTokenAddress;
        router = IMoDexCoinRouter02(routerAddress);
        owner = msg.sender;
        totalBulkBuys = 0;
        performanceFee = 1;
        managementFee = 1;
        //Register sfsContract = Register(0xBBd707815a7F7eb6897C7686274AFabd7B579Ff6); // This address is the address of the SFS contract
        Register sfsContract = Register(0x2941Ca37969BEC5E08535E16AbB5694801079B3e);

        sfsContract.register(msg.sender); //Registers this contract and assigns the NFT to the owner of this contract
    }

    /**
    将新资产合约地址添加到 assets 数组中，并触发 NewAssetAdded 事件。
     */
    // Add to asset array
    function addAsset(address _contractAddress) public {
        assets.push(Asset(_contractAddress, 0));
        emit NewAssetAdded(_contractAddress, block.timestamp);
    }

    /**
    返回所有当前资产的数组。
     */
    // Get current asset array
    function getAllAssets() public view returns (Asset[] memory) {
        return assets;
    }

    /**
        新增USDT/总USDT=新增LP/总LP；即 新增USDT/新增LP=总USDT/总LP。
     */
    // Bulk buy function that buys for everyone who pitched in money
    function bulkBuy() public {
        // Should only be interacted with by the owner
        require(msg.sender == owner, "Can't be interacted");

        // Must have some usdts
        require(
            IERC20Extended(baseTokenAddress).balanceOf(address(this)) > 0,
            "Don't have anything"
        );

        // Approve balance to router
        IERC20Extended(baseTokenAddress).approve(
            routerAddress,
            IERC20Extended(baseTokenAddress).balanceOf(address(this))
        );

        // Total new balance and LP token supply
        uint256 totalCurrentBalance = IERC20Extended(baseTokenAddress)
            .balanceOf(address(this));
        if (totalBulkBuys == 0) {
            // 如果这是第一次批量购买，则直接铸造等量的LP代币。
            indexLPToken.mint(address(this), totalCurrentBalance);
        } else {
            uint256 totalLp = indexLPToken.totalSupply();
            uint256 one = 1000;
            // Current worth of all assets
            uint256 totalCurrentWorth = totalCurrentBalance;
            totalCurrentWorth += currentWorth();
            // 计算 totalCurrentBalance 相对于所有资产的总价值 totalCurrentWorth 的比例 ratio
            uint256 ratio = totalCurrentBalance.mul(1000).div(
                totalCurrentWorth
            );
            uint256 denominator = one.sub(ratio);
            // 通过该比例调整 LP 代币供应量，使 LP 代币总供应量与总资产价值成比例。
            if (denominator != 0) {
                uint256 newTotalLP = totalLp.mul(1000).div(denominator);
                indexLPToken.mint(address(this), newTotalLP.sub(totalLp));
            } else {
                indexLPToken.mint(address(this), totalCurrentBalance);
            }
        }

        // Divide total balance into 10
        uint256 equalBalance = IERC20Extended(baseTokenAddress)
            .balanceOf(address(this))
            .mul(10)
            .div(100);

        // Set current time
        lastBuyTime = block.timestamp;
        // Note current balances of all assets
        uint256 totalAssets = assets.length;
        uint256[] memory currentBalances = new uint256[](assets.length);

        /**
        记录当前合约持有的每种资产余额，以便稍后计算每个用户获得的份额。
         */
        // Note current balances of all assets
        for (uint256 j = 0; j < totalAssets; j++) {
            // Get the amount of tokens the contract has
            currentBalances[j] = IERC20Extended(assets[j].contractAddress)
                .balanceOf(address(this));
        }

        /**
            遍历 assets 数组，使用 router.swapExactTokensForTokens 
            将 equalBalance 的 baseToken(就是USDT) 换成每种资产的代币，并存入合约。
         */
        // Loop and buy each asset
        for (uint256 i = 0; i < totalAssets; i++) {
            address[] memory path = new address[](2);
            path[1] = assets[i].contractAddress;
            path[0] = baseTokenAddress;
            // 用 ERC20 兑换 ERC20，支付的数量是指定的（指定输入数量amountIn），而兑换回的数量则是未确定的
            router.swapExactTokensForTokens(
                equalBalance,
                0,
                path,
                address(this),
                block.timestamp
            );
        }

        // Loop and buy each asset for each user
        uint256 totalBuyers = nextBuyers.length;

        // Each buyer
        for (uint256 i = 0; i < totalBuyers; i++) {
            uint256 userUsdtBalance = userBalances[nextBuyers[i]].usdtBalance;

            /**
                计算每位用户的 USDT 余额 userUsdtBalance 在总余额 totalCurrentBalance 中的比例，
                并根据该比例分配 LP 代币。
             */
            // Send LP to user
            indexLPToken.transfer(
                nextBuyers[i],
                indexLPToken.balanceOf(address(this)).mul(userUsdtBalance).div(
                    totalCurrentBalance
                )
            );
            uint256 userEqualBalance = userUsdtBalance.mul(10).div(100);
            /**
                为每个用户分配每个资产。
                对每种资产进行分配，计算每个用户对应的资产份额。
             */
            // Each asset
            for (uint256 j = 0; j < totalAssets; j++) {
                // Get the amount of tokens the user has
                uint256 assetBalanceOfContract = IERC20Extended(
                    assets[j].contractAddress
                ).balanceOf(address(this)).sub(currentBalances[j]);
                userBalances[nextBuyers[i]].balances[
                    assets[j].contractAddress
                ] += assetBalanceOfContract.mul(userEqualBalance).div(
                    equalBalance
                );
            }
            // 清空每位用户的 usdtBalance，表示资产已兑换。
            // Empty usdt balance
            userBalances[nextBuyers[i]].usdtBalance = 0;
        }

        // 重置 nextBuyers 数组，准备下一轮购买。
        // Empty next buyers array
        nextBuyers = new address[](0);
        // 将 totalBulkBuys 自增，记录批量购买次数。
        // Add to total buys
        totalBulkBuys++;
    }

    /**
        当前合约（地址）批量批准 assets 中所有资产的代币余额，授权给 router 合约。
        routerAddress 的授权额度为当前合约地址拥有的所有资产代币余额。（当前合约address -> 授权 -> routerAddress)
     */
    function approveEverything() public {
        _approveEverything();
    }

    function _approveEverything() internal {
        uint256 totalAssets = assets.length;

        // Loop and sell each asset
        for (uint256 i = 0; i < totalAssets; i++) {
            uint256 contractBalance = IERC20Extended(assets[i].contractAddress)
                .balanceOf(address(this));
            if (contractBalance > 0) {
                IERC20Extended(assets[i].contractAddress).approve(
                    routerAddress,
                    contractBalance
                );
            }
        }
    }

    /**
        该函数用于卖出用户在 PocketIndex 中的所有资产，并将其换回基础代币（如 USDT）退还给用户。
        卖出用户在指数中的全部资产并将收益（例如 USDT）退还给用户。
     */
    // Sell a user's balance and give him back his usdts
    function disolvePosition() public {
        uint256 balanceBeforeSell = IERC20Extended(baseTokenAddress).balanceOf(
            address(this)
        );
        uint256 totalAssets = assets.length;
        address[] memory path = new address[](2);
        path[1] = baseTokenAddress;
        // 定义 userBalance 变量用于存储用户的每种资产余额。
        uint256 userBalance = 0;
        _approveEverything();
        for (uint256 i = 0; i < totalAssets; i++) {
            path[0] = assets[i].contractAddress;
            // 获取用户在当前资产中的余额，并使用 router.swapExactTokensForTokens 将该余额兑换为 baseToken。
            userBalance = userBalances[msg.sender].balances[
                assets[i].contractAddress
            ];
            // 把to address设置为当前合约地址
            router.swapExactTokensForTokens(
                userBalance,
                0,
                path,
                address(this),
                block.timestamp + 5
            );
        }
        // 计算本次交易中用户获得的 baseToken 总量，即当前余额减去初始余额。
        uint256 userUSDTBalance = IERC20Extended(baseTokenAddress)
            .balanceOf(address(this))
            .sub(balanceBeforeSell);
        uint256 _managementFee = userUSDTBalance.mul(managementFee).div(1000);
        uint256 _performanceFee = userUSDTBalance.mul(performanceFee).div(1000);

        // 遍历资产，重置用户每种资产的余额为零。
        // Loop and set asset balances to 0
        for (uint256 i = 0; i < totalAssets; i++) {
            userBalances[msg.sender].balances[assets[i].contractAddress] = 0;
        }
        userBalances[msg.sender].usdtBalance += userUSDTBalance
            .sub(_managementFee)
            .sub(_performanceFee);
        // 扣除费用后，将净收益转回到用户账户  当前合约转USDT给msg.sender
        IERC20Extended(baseTokenAddress).transfer(
            msg.sender,
            userBalances[msg.sender].usdtBalance
        );
        // 将用户的 usdtBalance 重置为零，完成退出操作。
        userBalances[msg.sender].usdtBalance = 0;

        // Transfer lp tokens to self and burn
        uint256 userTotalLp = indexLPToken.balanceOf(msg.sender);
        indexLPToken.transferFrom(msg.sender, address(this), userTotalLp);
        // burn(uint256 value)：销毁msg.sender(在这里是合约地址自身)的value个代币。
        indexLPToken.burn(userTotalLp);
        // 打印事件
    }

    /**
        根据用户的 Index LP 代币数量，按比例卖出用户资产并将收益返还用户。
     */
    // Sell a user's balance and give him back his usdts according to his lp tokens
    function disolveWithLP(uint256 amount, address sender) public {
        require(sender == msg.sender, "Can't be interacted");
        require(amount > 0, "Amount must be greater than 0");
        require(
            indexLPToken.balanceOf(sender) >= amount,
            "Must have said balance"
        );
        // calculate total lp balance of user
        uint256 totalLp = indexLPToken.balanceOf(sender);
        uint256 balanceBeforeSell = IERC20Extended(baseTokenAddress).balanceOf(
            address(this)
        );
        uint256 totalAssets = assets.length;
        uint256 ratio = amount.mul(100).div(totalLp);
        require(ratio > 0, "ratio must be greater than 0");

        address[] memory path = new address[](2);
        path[1] = baseTokenAddress;
        _approveEverything();
        for (uint256 i = 0; i < totalAssets; i++) {
            path[0] = assets[i].contractAddress;
            uint256 userBalance = userBalances[sender]
                .balances[assets[i].contractAddress]
                .mul(ratio)
                .div(100);
            router.swapExactTokensForTokens(
                userBalance,
                0,
                path,
                address(this),
                block.timestamp + 5
            );
            userBalances[sender].balances[
                assets[i].contractAddress
            ] -= userBalance;
        }

        uint256 userUSDTBalance = IERC20Extended(baseTokenAddress)
            .balanceOf(address(this))
            .sub(balanceBeforeSell);
        uint256 _managementFee = userUSDTBalance.mul(managementFee).div(1000);
        uint256 _performanceFee = userUSDTBalance.mul(performanceFee).div(1000);

        userBalances[sender].usdtBalance += userUSDTBalance
            .sub(_managementFee)
            .sub(_performanceFee);
        IERC20Extended(baseTokenAddress).transfer(
            sender,
            userBalances[sender].usdtBalance
        );

        userBalances[sender].usdtBalance = 0;

        /**
        为什么先 transferFrom 再 burn？
        在标准的 ERC20 代币合约中，burn 通常只能销毁代币持有者自己账户中的代币。
        因此需要先将用户的代币转移到合约地址，再由合约销毁。
         */
        // Transfer lp tokens to self and burn
        indexLPToken.transferFrom(sender, address(this), amount);
        // burn(uint256 value)：销毁msg.sender(在这里是合约地址自身)的value个代币。
        indexLPToken.burn(amount);
        // 打印事件
    }

    /**
    允许用户投入资金到合约中，用于下一次批量购买。
     */
    // New user pitches amount to bulk buy
    function pitchAmount(uint256 amount, address from) public {
        require(
            IERC20Extended(baseTokenAddress).balanceOf(msg.sender) >= amount,
            "Don't have enough amount in e.USDT"
        );

        // Transfer the amount to the smart contract
        IERC20Extended(baseTokenAddress).transferFrom(
            from,
            address(this),
            amount
        );

        // Increment user USDT balance
        userBalances[msg.sender].usdtBalance += amount;

        // 如果用户未被添加到 nextBuyers 队列中，则将其添加到队列中，表示该用户参与到下一轮的批量购买操作。
        // Add to next buyers array
        if (!buyerAlreadyAdded(msg.sender)) {
            nextBuyers.push(msg.sender);
        }
    }

    // Get current worth
    function currentWorth() public view returns (uint256) {
        // Current worth of all assets
        uint256 totalCurrentWorth = 0;
        address[] memory path = new address[](2);
        path[1] = baseTokenAddress;
        for (uint256 i = 0; i < assets.length; i++) {
            path[0] = assets[i].contractAddress;
            uint256 contractBalance = IERC20Extended(assets[i].contractAddress)
                .balanceOf(address(this));
            if (contractBalance > 0) {
                uint256[] memory amounts = router.getAmountsOut(contractBalance,path);
                totalCurrentWorth += amounts[1];
            }
        }
        return totalCurrentWorth;
    }

    // Get user's USDT balance
    function getUSDTBalance(address user) public view returns (uint256) {
        return userBalances[user].usdtBalance;
    }

    // Withdraw from user's USDT balance
    function withdrawUSDTBalance(address user, uint256 amount) public {
        require(
            userBalances[user].usdtBalance > 0,
            "Don't have anything to withdraw"
        );
        require(
            amount >= userBalances[user].usdtBalance,
            "Don't have enough amount to withdraw"
        );
        IERC20Extended(baseTokenAddress).transfer(user, amount);
    }

    // Get user's balance for all assets
    function getBalances(address user) public view returns (uint256[] memory) {
        uint256 totalAssets = assets.length;
        uint256[] memory balances = new uint256[](totalAssets);
        for (uint256 j = 0; j < totalAssets; j++) {
            balances[j] = userBalances[address(user)].balances[
                assets[j].contractAddress
            ];
        }
        return balances;
    }

    // Get user's balance for a specific asset
    function getBalance(
        address user,
        address _contractAddress
    ) public view returns (uint256) {
        return userBalances[address(user)].balances[_contractAddress];
    }

    // Get last buy time
    function getLastBuyTime() public view returns (uint256) {
        return lastBuyTime;
    }

    // Get next buyers array
    function getNextBuyers() public view returns (address[] memory) {
        return nextBuyers;
    }

    // Get total amount of assets
    function getTotalAssets() public view returns (uint256) {
        return assets.length;
    }

    // Get total amount of assets
    function getTotalBuyers() public view returns (uint256) {
        return nextBuyers.length;
    }

    // Get total amount invested in a specific asset
    function getTotalInvestedForAsset(
        address _contractAddress
    ) public view returns (uint256) {
        return IERC20Extended(_contractAddress).balanceOf(address(this));
    }

    // set indexLPToken address
    function setIndexLPToken(address _indexLPToken) public {
        indexLPToken = IIndexLP(_indexLPToken);
    }

    // PRIVATE FUNCTIONS

    // See if user is already added to nextBuyers array
    function buyerAlreadyAdded(address buyer) internal view returns (bool) {
        uint256 totalBuyers = nextBuyers.length;
        for (uint256 i = 0; i < totalBuyers; i++) {
            if (nextBuyers[i] == buyer) {
                return true;
            }
        }
        return false;
    }
}
