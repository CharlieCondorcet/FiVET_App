package cl.ucn.dics.pdis.fivetapp;

import cl.ucn.disc.pdis.fivet.zeroice.model.Contratos;
import cl.ucn.disc.pdis.fivet.zeroice.model.ContratosPrx;

import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.ObjectPrx;
import com.zeroc.Ice.Util;
import com.zeroc.Ice.InitializationData;
import com.zeroc.Ice.Properties;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

/**
 * The ZeroIce class.
 *
 * @author Charlie Condorcet.
 */
@SuppressWarnings("Singleton")
public final class ZeroIce {

    /**
     * The Logger.
     */
    private static final Logger log = LoggerFactory.getLogger(ZeroIce.class);

    /**
     * The Singleton.
     */
    private static final ZeroIce ZERO_ICE = new ZeroIce();

    /**
     * The ZeroIce communicator.
     */
    private Communicator theCommunicator;

    /**
     * The Contratos implementation.
     */
    private ContratosPrx theContratos;

    /**
     * The Constructor
     */
    private ZeroIce() {
        // Without parameters
    }

    /**
     * @return the ZeroIce.
     */
    public static ZeroIce getInstance() {
        return ZERO_ICE;
    }

    /**
     * Get the initialization data to build the Communicator.
     * @param args
     * @return the {@link InitializationData}.
     */
    private static InitializationData getInitializationData(String[] args) {

        // The ZeroC properties
        final Properties properties = Util.createProperties(args);
        properties.setProperty("Ice.Package.model", "cl.ucn.dics.pdis.fivetapp.zeroice");

        InitializationData initializationData = new InitializationData();
        initializationData.properties = properties;

        return initializationData;
    }

    /**
     * @return the Contratos.
     */
    public ContratosPrx getContratos() {
        return this.theContratos;
    }

    /**
     * Start the communication.
     */
    public void start() {
        if (this.theCommunicator != null) {
            log.warn("The Communicator was already initialized?");
            return;
        }

        this.theCommunicator = Util.initialize( getInitializationData (new String[1]));

        // The name
        String name = Contratos.class.getSimpleName();
        log.debug("Proxying <{}> ..", name);

        // The proxy 4 TheSystem
        ObjectPrx theProxy = this.theCommunicator.stringToProxy(name + ":tcp -z -t 15000 -p 8080");

        // Trying to cast the proxy
        this.theContratos = ContratosPrx.checkedCast(theProxy);

    }

    /**
     * Stop the communications.
     */
    public void stop() {
        if (this.theCommunicator == null) {
            log.warn("The Communicator was already stopped?");
            return;
        }
        this.theContratos = null;
        this.theCommunicator = null;
    }


}
